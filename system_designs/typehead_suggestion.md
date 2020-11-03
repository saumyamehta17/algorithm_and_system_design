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

    