cache has limited size
what is size of cache for 1 month
what is eviction policy
handle Stale data - when data is updated, removed or added new. Can be mitigated by setting TTL
cache hit/cache miss
when to update cache:
	write-through = write to cache and cache will write to db store at same time.
	write-back = write to cache and cache will enqueue data to store in db asyncrounsly, but 	what if cache node fails and data lost

cache invalidation - Cache replacement policies


disadvantage - 
 when cache miss, there will high latency
 when cache node fails

scale - before reach to final design, Do Benchmark/Load Test, Profile the Bottlenecks

Expanding memory cache to many machines:
  - each cache machine in cluster has its own cache
  - each cache machine in cluster has copy of cache
  - cache is sharded in each cache machine in cluster, we can use hashing to determine which node will have cache data for given query string. OR we can consistent hashing
