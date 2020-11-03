### What and Why
limiting number of requests in a given period. 
Useful to overcome **Denial of Service**, hacker trying to many **login attempts to hack the account** or **revenue model**

### Requirements
create an api to check limit of user for given api
fixed window or sliding window
Two scopes: limit 10 request per minute + 500 requests per hour
multiple apis or single api
Scalable

### [High level design](https://docs.google.com/drawings/d/1ikYf8cV_VbFZzfnlSQ0AJo7JACfO9xi5nHLZ6lbYD1A/edit)

### HTTP status - 429(too many requests)

### Throttling(controlling the usage of api) types
- Hard throttling(can not exceeds)
- Soft throttling(Can exceeds say 10%)
- Elastic/dynamic throttling(can exceed if resources are available)

### Api
api/v1/limit?key=user_id
response = boolean

### Algo
redis can have structure like:
user_id: {count: 1, start_time: timestamp}

#### Fixed Window
api request with key and service will search in cache

```
if res = redis.get(key)
   if curr_time - res[start_time] >= 1 minute
     redis.delete(key)
     return true  
   elsif res[count] >= 10
     redis.delete(key)
   else
     redis[count] += 1
   end
else
  redis.set(key, {count: 1, starttime: curr_time})
end
```


Problems: 
1) Distributed Cache and concurrent request from a user, solve with Redlock
2) one user may requests 10 api in last second of a minute and then 10 more after this second is completed, so in all user can ask for 20 api in 1 minute

Memory:
4 byte may needed to lock each user's record
20 bytes for hash table overhead 

#### Sliding Window
user_id: {timestamps: sorted_set timestamps}

```
if res = redis.get(key)
   if res[timestamps].count >= 10
      res.delete(key)
      return false
   else
      res[timestamps] << Time.now
      remove timestamps which are >= curr_time - 1.minute
   end
else
  redis.set(user_id, {timestamps: Time.now})
end   
```
Memory:
20 for bytes overhead of sorted_set
20 for bytes overhead of hash

#### Sliding window with counters: multiple fixed window
500 req per hour + 10 req per minute per user

### Data shard and cache
shard per user per api? create_url and delete_url?
shared based on user_id?


### rate limiting by
- IP, what if multiple users share some ip like in offices
- User
- Hybrid

