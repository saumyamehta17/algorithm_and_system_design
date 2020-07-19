### FR
- User can search video
- User can view/download the videos
- System should recommend videos

### Two tier of load balancing
First, it will distribute load across multiple zones using AWS ELB, then again load is balanced in those area let say few state wise.

### Transcoding(this is how netflix onboard videos)
Netflix supports many different devices, so each video is processed and creates multiple copies based on resolution and size
```
resolution - 1080p
bitrate - 3Mbps
```
It sends video based on internet quality to user device. If its low then video with low resolution is sent.

For all this Netflix creates around 1200 copies

### ZUUL

* a Gateway Proxy by Netflix, basically intercept all the traffic and applying series of request filter and then route to underlying service and again at the time of response.

####Background
Because subscribers and actual hours of service usage growing:
Tens of Billions of requests per day
Hundreds of TB transferred per day

#### ZUUL 1.0
- Microservice Authentication and Security at gateway layer
- Monitoring
- Dynamic Routing
- Runtime Stress Testing
- Dynamic Load Shedding(Throttling)
- Static Response handling

`Problem` - Latency, Concurrent Connections, Thread count

`Hystrix` open source Netflix framework do lot of things, one task is circuit breaking. If the request taking more than it should, cut it off then return a reasonable fallback(For latency Problem). It can perform following:
- Handle timeout calls, if exceed than predefined time
- Reject requests if thread pool of full
- Disconnect the service if responding with error
- metrics

For high number of connections and threads, throttle requests
`Still Problem` for how long we can throttle requests, it causes Netflix down

#### Non-Blocking 
- Asynchronous Programming
- Event Loop Pattern

#### Netty
- on Top of Event Loop

### Databases

#### MySql
Billing Info, Transaction info, User info

#### EV cache
Ephemeral, Volatile cache

Its a memcached based caching solution. Usage example: Movie and TV shows similarity

#### Cassandra
User History or User Interest, and all big data. To better utilize this, Netflix compress old data and save it on other nodes

### Kafka & Chukwa
Netflix produces around 500Billions of events per day and 1.3PB everyday. This events are like: 
- Video viewing activity
- UI activity
- Error Logs
- Performace events

Chukwa is a data collection system for large distributed system. Built on top of the HDFS and Map/Reduce frameworks.

Chukwa ----> Kafka Stream ----> ElasticSearch

### Spark
content recommendation and personalization

### Movie Recommendation

### OpenConnect
Small OC - contain only popular videos, which are for small ISPs
Big OC - will contain all data which netflix has

Now how data is being available in OC,
Based on user interest and viewing history, videos are cache on OC in off hours. Still if user wants to see something else which is not present in OC then that is brought from data centers. It uses consistent hashing at OC.
It also helps ISPs to save their bandwidth.






