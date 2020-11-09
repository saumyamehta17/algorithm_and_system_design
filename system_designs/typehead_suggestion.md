### TypeHead Suggestions/AutoSuggestions, usage: when user enters text for searching

#### Requirements
- how many searches to show(lets say 5)
- Most popular searches should come based on query, for example: popularity of query can be determined by frequency of query being searched
- Average length of query? lets say 5 words

#### Estimation
- how many requests per second?
```text
 2 Billion per day
 =~ 30k per second
 1 server serves = 5k concurrent requests
 lets say latency is = 100ms for a request which mean 1 sec could serve 10 requests
 5k*10 = 50k requests/second, so need 1 machine
``` 

#### Latency and availability is important, but can compromise on consistency

#### API

- GET search?query=text
- POST update_frequency(search_text)

#### Data Store
- We can keep phrase and frequency somewhere and then periodically(hourly basis) update our trie, because updating trie 
 for each read request would not be efficient.
- For this we can use any NoSql db
- Primarily our data structure would be Trie and at each node we can keep top k words to return for low latency

### Scaling
- if requests grow, then one Trie/ one machine could not serve that much requests
- When requests come, then shard tries over multiple machines like a-k one machine and k-z on another
- We can keep some configuration tool like *ZooKeeper* to manage this mapping.

### Improvements  
- Keep a Redis/memcache on top of this trie machines
- Add CDN, which is usually close to the end users instead of touching data centers


    