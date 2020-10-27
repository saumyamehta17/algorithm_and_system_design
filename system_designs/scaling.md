## The Catchies

## Scaling
It is a capacity of system to grow to manage increased demands eg. increased data volume, increased amount of work

## vertical scaling - adding more power to existing machine(Eg Mysql)

increasing process, memory, cores but at some point its not enough resource. Even though now a days CPU come with many cores, for example quadcores which has 4 cores or 4 brains in one chip.
in old days, when one core which perform 4 tasks like - printing, google map opening etc are happening simultenously but in reality, CPU is spliting and scheduling all 4 program serially.
But with 4 cores - 4 requests can be served at the same time.

Single Machine is limited to some capacity

## Disks and Memory

Reading 1MB from cache take 250 microseconds and SSD takes 4x and from disk takes 80x longer
1 second - 1k miliseconds, 1 milisecond - 1k microsecond
1 second - 1000000

## Horizontal scaling

We can assume that there is always a ceiling, don't cross that, even buy more cheaper/slower computers instead one big good machine which is expensive
So how would we handle more than machine, where user will send request.
Here's come Load Balancer

Now **Loader Balancer** can have public ips and other machine can private ips
benefits:
- Bad guys on internet can not access our machine private ips directly
- public ips(version 4 - 32 bit ip) are expensive and world is running out of these, and other private ips could be 192.168 0r 10.0 like which we have at our home. This will alleviate the pressure of buying public ips for each machine

### How Loadbalancer distribute requests
- Round Robin, first send to server1, then to server2 and so on. Here Problem is some server by bad luck get heavy requests and other server may get just simple login request.
- distribute based on load
- distribute based on nature of server. Like rails request goes to rails server and image request goes to image server.

``load balancer is single point of failure``

one more load balancer can be connected to first to form a cluster. Each LB monitors the health of other. Second will take over if one fails.

``Problem: Session``

Session is not a problem when you have one server but when your website become so popular and now you have many servers

user might have logged in on one server, what if next page load its being sent to another server and it will ask for login details again. There is tmp folder in linux system where sessions are stored as serialzed text file which mean session might be sitting on hard drive of one system.

Then probabaly Round Robin will not help.

Should we save session in db?

`LB Softwares` - ELB, HAProxy, LVS

`LB Hardwares` - Citrix

``Sticky Session``
No matter how many times you do a request, it gonna end in same server

``Cookies``
it has finite size , few KB and may be keep server_id in cookie and load-balancer will remember that which id is which server.


### Caching

#### Mysql cache

enable `query_cache_type = 1` in my.cnf, which we cache these identical queries happening if that row is not updated. ex - user is navigating website 

#### Memcached 

its another software which could in another machine or same machine which maintain key-value in memory and its very fast. It will add key-value to cache if its not there and serve from cache next time for same if. Its a finite resource, what you do when it become big:

expires cache based on some eviction policies
What if power is off and memory cache will be lost, so there is memorytable engine

Memory Table, Archive Engine

### when load balancer dies

we can have 2 load balancer, hearing each other heartbeat(packets) at fixed interval. If one will not get this packet then it will take over on Ip assuming other died.

### Datacenters

datacenter goes off? Distribute load across data centers which is DNS based load balancing
its a global load balancer, which gives multiple ip addresses(which is of entries of different building) . If there is downtime in building/datacenter, probabaly DNS will still give stale data because its cached somewhere.


### Security
outside traffic will come encrypted with port 443, and it can be decrypted at loadbalancer of datacenter and its safe there. then it can communicate with further with port 80, sql server default port is 3306 etc


### Latency
p99
p95




