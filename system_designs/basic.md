### Pickies
- FR, NFR, Estimation, API(which api), High Level Design, Model & indexes, Low Level Design, Scaling
- User or Clients
- Expensive Joins, denormalize
- Think about entities could daily or monthly ?
- Is it read-heavy or write-heavy?
- drive upload/writes from reads available from ratio like 1:200
- Should we run back-of-envelope usage calculations? Million - 6 zeros, Billion - 1000 Million. 	Mistake - number_of_records * what(12 months, 365 days)
- How much code expected to write?
- Do we need asynchrouns processing, think about kafka
- LB, Shard DB(Range Based, Feature Based, CH), Replicas, Caching
- Trade-offs and future improvements
- latency, bandwidth

### Read-heavy or write-heavy

### Reverse Proxy 

a server/website public face, which take request from client and forward it to backend servers and even works with one webserver/application server
- security, no information about backend servers are known to outside world. Many reverse proxy servers include features rejecting traffic/blacklisting particular ips, limiting the number of connections from each client
- scalability and flexibility, because client can see this public face you are free to change the configuration of your backend infrastructure
- Compression - Compressing server responses(ex - with gzip) to reduces the amount of bandwidth
- SSL - decryption and encryption can be computationally expensive, By decrypting incoming requests and encrypting server responses, the reverse proxy frees up resources on backend servers.
- Caching - Before returning the backend server’s response to the client, the reverse proxy stores a copy of it, locally. When the client (or any client) makes the same request, the reverse proxy can provide the response itself from the cache instead of forwarding the request to the backend server. This both decreases response time to the client and reduces the load on the backend server.

### HAProxy

which stands for High Availability Proxy, is a popular open source software TCP/HTTP Load Balancer

Types:

Type4(at Transport Layer) - TCP - forward request based on Ip
for ex - yourdomain.com/anything

Type7(at Application Layer) - HTTP- forward request based on content
for ex - yourdomain.com/blog, yourdomain.com/feedback

Algorithms
* RoundRobin - selects servers in turn. Its a default algorithm
* leastconn  - selects servers with least no of connections
* source     - selects servers based on hash of requested ip address. mainly used to ensure that user will be connect to same server.


Health Check - Single Point of failure if we have one load balancer, so we can active/passive HA setup.

### Reliability(performance standard) vs availibility
https://trello.com/c/gOSxI82y/57-scalling

### Data Partitioning
https://trello.com/c/gOSxI82y/57-scalling, and search "Sharding or partition"

### Long-Polling vs WebSockets vs Server-Sent Events

##### Ajax Polling
client repeatedly makes a request for server data. If no data is availble then empty response is returned. Problem HTTP overhead as most of the time response is empty and client has to keep asking for new data

##### Long Polling
It allows server to push data when its available. Client make a HTTP connection(hanging GET), server holds it for some time and respond back when data is availble. These requests also has timeout.

##### Websockets


##### Server-Sent Events



