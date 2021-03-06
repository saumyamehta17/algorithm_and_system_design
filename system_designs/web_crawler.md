### What
A s/w program which browses the world wide web in some automate manner

Usage:
- to check copyright infringments
- to make mirror sites for popular websites
- for data science/data anayltics

### FR
- Is it for HTML pages only? Or video, audio, images etc? Lets go with html pages.
- Protocols? HTTP, FTP ?
- Robot.txt

### NFR
- Scalable
- Extendable

### Estimation

```
Total website = 1 Billion
5 pages per website
total webpages = 5 Billion
each page has = 100KB
total data to be stored = 5*100 Billion ~= 5PB

```

### High Level
URL Service - which has seed data from where url can be taken to process

HTML Fetcher - which could connect to internet and do handshaking and get content from servers.

Extraction service - which fetch urls from HTML fetcher and add it to list of urls in url service. and save data to data store
Eliminate duplicate data.

Seed Urls can be formed from DMOZ(directory of Web) 

BFS/DFS approach

#### URL service
which remove url from queue and crawls it in BF traversal. Now there could many urls approx, billion of urls then we can add more machines for this and each machine have multiple worker threads.

We should not populate one machine with lot of urls while crawling, so lets delegate url assignment to some hash function which put url to queue of some machine.

#### Fetcher Service
which download content for a given url. Now every site has robots.txt, we can keep this file in fixed-size cache to avoid downloading it in every request. Our crawler will also use this file for exclusion rules

#### De-dup test
multiple website could be there with same content and different url. Then to avoid processing it again, we can maintain a checksum(64-bit) using MD5 or SHA

```
For 5 Billion pages, checksum will huge
checksum size = 64bit = 8bytes = 5B*8bytes = 400 GB
```
We can keep cache for these checksum, if its found in cache and back storage then ignore the document else calculate checksum and save it to cache and storage

#### DNS Service
start caching IP address in local DNS, because as per number of pages then it could be big bottlenecks to resolve domain names

#### robots.txt
a file create by webmaster which make certain part of website should not be crawled, reason are:
- If they allow to crawl their website by third parties can slow down their server
- or cause server errors
- But this file can be ignored

You can find this file example-website/robots.txt

#### Bloom Filters
to dedup url, can use false positives, `Problem` each false negative will cause the URL not be added to frontier.

### Crawler Traps
caught in cycle

### User Flow
when user searches some keyword, it will go to web_server and check if keyword is available or not.
Also most popular searches can be place in cache

Also question, how frequenctly we want to refresh out crawler results, once a week? Then mark the results with time

#### APIs

``
/api/v1/search?keyword="HelloWorld"
``
and response will array of hashes containing titles, snippet, urls etc

### Data Partitioning

### More
- Sites are too dynamic
- Frequent data changes
