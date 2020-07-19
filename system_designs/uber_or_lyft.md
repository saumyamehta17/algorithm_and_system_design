### Uber/Lyft/Grab/Taxi System Design

#### Requirements
- User can book a taxi(Uber Pool OR one rider per vehicle)
- User can see nearby drivers/cabs
- Driver can accept the request
- Driver needs to send its location every few minutes
- Post trip pipeline operations:
  - collect rating, send emails, schedule payments
     
#### API
- api/v1/open?source_location
- api/v1/book?src&destination

### Databases
Redis, Mysql, 
Riak - NoSql KV Database, Uber using for keeping state from dispatch services

### Schema

Driver
Vehicle - id, number_plate, no_seats, children_seat, model, color, driver_id, wheelchair_accessable?


#### High Level System
- Supply Service, for that driver needs to send his/her location/GPS/lat_long
- Demand Service, track user location when requested
- match this supply to demand, that's it, how ??
 
- matching a dynamic demand with dynamic supply in realtime and client connect to the dispatch system which matches drivers and riders.

##### How ETA is calculated
This dispatch system needs Street maps and historical travel times to estimate current travel time.

#### Original Dispatch System vs New Dispatch System
- **Sharded by city**, each city can run independently but as more and more cities were added it become un-managable, Because some cities are big and some are small. Some have big load spikes and other don't.

### Geospatial Index
handle million of writes per second and many more reads than writes per second needs to be super scalable. This service runs on hundreds of processes. 
Uber divides the earth into tiny cells using Google S2.  Each cell has a cell_id.

These indexes use some data structure like QuadTrees, k-Trees, Octree etc

Basically we need to find the distance b\w each points, the simply if we have n = 10, then it will take n**2 operations
```
n = 10
10x10 = 100
n = 100, then 10,000
complexity is exponential
```   
Why shouldn't we limit the matching points in some range, QuadTrees will divide whole area in 4 sections, those sections can be divided into further 4 sections based on capacity. 
so complexity is log(nlogn)

#### If locations are not changed frequently(ex. yelp, just dial), then following are solutions:

- Use Mysql, having lat and long along with their indexes.
To find all places with lat, long and radius 'd', query would be
```mysql
select * from Places where lat between (x-D and x+D) and long between (y-D and y+D); # Query may not be correct, just an idea 
```
As we indexes for lat long assuming that we have 500M places, then it would be huge list, can we somehow shorten this, see another solution below:

#### Grids
If we divide whole map in grids. Each Grid will store all Places residing within range of lat and long. This would query only few grids to find nearby locations.
Grid size will be fixed, and when we know some lat and long resides in specific grid, we can only query that grid and 8 neighbouring grids to find out places. Query would be:
```mysql
select * from Places where lat between (x-D and x+D) and long between (y-D and y+D) and grid_id in (GridID, GridID1, GridID2...GridID8);
```
This is definitely reduce runtime of query;

```text
Earth area is 200M miles square
lets assume a grid size is 20 miles square
total grids will be = 10 million grids

To, store the index
Since location_id is 8 bytes,
memory = 10M * 4bytes(for grid_number) = 40KB + (8(location_id) * 500M(total places)) = 40KB + 4GB ~= 4GB 
```

Our solution can still run slow, as places are unevenly distributed. Some grids might have more places than other.
What if, we break grid into smaller grids whenever we have lot of places. 

#### Dynamic size grids
So, we can divide our grid into further 4 grids if capacity(no of places) of a grid is reached. Now in this way, populated areas like **San Francisco** will have lots of grids and sparsely populated areas like Pacific Ocean will have large grids.

- Which DataStructure to use?
 **QuadTree**, A tree which can 4 children nodes. If any node reaches its capacity(500 places) then we will break it down to create four child nodes further. So leaf node will contains the places. 
 
- How we will build a QuadTree?
At first, whole world is one grid, the divide that big grid into grids until each grid have no more than 500 places.

- How we will find the grid for given location?
Starting from root node, check which children has your location. Keep moving downwards, until node is not leaf node.

- How to find neighboring grids?
Because leaf node only contains info. We can create a doubly linkedlist to connect leaves to find nearby grids. Once we have all location_ids then we can query database to get full details of locations.

- Memory?
```text
total places = 500 Million
total grids = 500M/500 = 1 Million grids, considering grid capacity is 500 places
Each grid will hold location_id(8bytes), lat(8bytes), long(8bytes) = 24 bytes
total memory for a grid = 500 * 24bytes = 12 KB
total memory by all grids = 12 KB * 1 Million = 12 GB

Also since leaf nodes contains info, each node has 4 pointers, each pointer could take 4 bytes
4bytes * 1Million(total grids) = 4 MB

So, 4MB + 12GB = 12.4 GB, can easily fit in modern day server 
```

- How we insert any new location in system?
Easy, find location and insert in that grid if capacity is under control, also add it to database

- Data Partitioning
  Based on Regions, we may partition our grids based on zipcodes such that all places belonging to a region can be stored on one node. But Problem is what if that node become hot. 
  
  Based on location_id, we need a hash function to map location_id to server where we will write or read. To find places near a location, it will query all servers, and each server
  will search for perfect grid and nearby grids as well and return set of nearby places to a centralized server which will aggregate result and return to user.
  
#### Replicas of QuadTrees Servers
We can have replicas of primary quadtree servers from where we can server reads, and ofcourse it might have inconsistency with primaries sometimes but its acceptable. What if
primary server dies, then secondary can control over after failover.

- What if both primary and secondary dies?
Ohh, we have rebuild quadtree for these server again by scanning whole database and using hash function with location_id. For time being when this is down, these locations will be
missing in result for user

- Can we do better with above problem?
We can have another index server, which can hold hashMap where key is server_numbers and value is set of all places for this server. We can use HashSet for places to make add/remove/
quickly.

#### Cache for database to keep hot places
So that once we find places from quadtree, it can ask cache first

#### Ranking
Rank search results by popularity or relevance?
    
 
### Uber: fast updates of driver location in every 5 seconds will fit in QuadTrees?
No, what about keeping locations in hash table and updating them within 15 seconds to quadtrees.
- DriverLocationHT - driver_id(4 bytes), old_lat, old_long, new_lat, new_long, and (8 bytes) for lat long = 4 + 8*4 = 30 bytes
- Total drivers = 1 Million = 30MB

- Now bandwidth, our service will consume to receive location updates from all drivers?
```text
Daily Active Drivers  = 500K
each driver will send driver_id(4bytes), lat(8bytes), long(8bytes) = 20Bytes in each 3 seconds
So, bandwith is = 500K*20Bytes = 10Million Bytes = 10MB per 3 seconds 
```  

### Do we need distribute DriverLocationHT onto multiple servers
Although bandwidth and memory does not require this, but for scalability, fault tolerance we should. How to distribute?

### Broadcast driver location to customers

### Request Ride Flow
- Customer request a ride
- Server will ask quadTrees for nearby driver locations
- Aggregate Server will collect list of location and will sort them
- Pick 3 drivers from list and send notification to drivers about the trip request.
- If all of them reject the request, then server will ask another 3 from list
- Else if one accept the request, cancellation request will go to another 2 drivers
- Accepted driver details and location will be sent to customer.

### Fault Tolerance & Replications
What if notification/driver_location server dies

### Ranking
Return drivers have more ratings


    







