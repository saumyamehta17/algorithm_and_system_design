### Little Description

cache is like short-term memory and has limited size
one node can keep cache data in memeory and returns it if it exists, else query from disk
what if we expand to more nodes? -> Global caches OR distributed cache
Cache can be in multiple form -> Application Layer Cache, CDN

### disadvantage of keeping in-memory cache
system fails, cache fails
if have more than 1 node, then consistency

#### Why we need cache

Reduce network calls
Avoid re-computation(for example - calculate average salary frequently, could be expensive if asking db again and again) and ofcourse speed up response

### Requirements

what is size of cache for 1 month, lets say in TB
what is eviction policy, lets say LRU
System should be scalable
System should be ofcourse 100% available

handle Stale data - when data is updated, removed or added new. Can be mitigated by setting TTL
Should we make distributed? based on load

cache hit/cache miss


### cache invalidation - when to update cache

`write-through`
write to cache and cache will write to db store at same time. High Latency

`write-back`
write to cache and respond to user and then cache will enqueue data to store in db asyncrounsly, but what if cache node fails and data lost. Low Latency

`write-around`
write to db first bypassing cache and return response from db itself, next time that data read will have cache miss and then cache will be updated. High Latency

### Thrashing

### eviction policy
FIFO
LIFO
LRU
MRU
RR
LFU - Counts
sliding window based policy

disadvantage - 
 when cache miss, there will high latency
 when cache node fails

scale - before reach to final design, Do Benchmark/Load Test, Profile the Bottlenecks

Expanding memory cache to many machines:
  - each cache machine in cluster has its own cache
  - each cache machine in cluster has copy of cache
  - cache is sharded in each cache machine in cluster, we can use hashing to determine which node will have cache data for given query string. OR we can consistent hashing

what is eviction policy