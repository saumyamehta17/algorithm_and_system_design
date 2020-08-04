### Functional Requirements
- User can upload/download photo
- User can follow/unfollow other users
- NewsFeed
- User can comment

### Non-Functional Requirements
- System should scalable
- Highly Available
- Reliable(any upload should not get lost)

### Estimation

```
Daily Active Users = 10 Million
1 user uploads in a day = 2
1 sec all users = 20 Million/86400 = 20 M/(5 zeros) ~= 200 requests per second

1 photo size = 50 KB
1 day photos = 20 Million * 50KB
10 year      = 20 Million * 50KB * 10 * 365  = 10000(+7zeros) * 365 = 3650TB ~= 3.6 PB
```

### High Level Design + Scalable
Photo uploads might slow down application even can block user who are just reading. Its read-heavy application.

[here](https://docs.google.com/drawings/d/1tD9EMtDOpYioFsz0ngHd4MTN3uQ8EaRjCmKxpHsQSl0/edit?usp=sharing)

### Data Model
- user model with id, name, email, reg_date
- photo table with id, owner_id, path, size, type
- follower table with id, follower_id, following_id

### Reliability
Losing file is not an option. So, we can create replicas of db. Creating copies of each photo will handle single point of failure.

### Data Sharding
Partition the data over multiple machines, following could be the strategies
#### user_id based

Now that we have approx 3.6 PB data, we can have 4 shards(each shard 1 PB lets say) and find the shard for user we will do 
```user_id % 4```
Problem: What if hot users came in one shard, then its not a uniform-distribution

#### photo_id based
generate unique photo_id across the system and then find the shard

### NewsFeed

steps: 

1) find all users whom I follow
```
select following_ids from followers where follower_id = user_id
```

2) fetch meta data info of 100 photos for each user and send them to ranking algorithm, Problem: Higher Latency
So, dedicated servers to pre-generate feeds which continuously generating feeds based on last time of generation. And user ask for feeds it will query this table.

##### Sending Feeds to users:
1) Pull: Client will pull news feed from server on regular basis, Problem is many time it will have empty response and wastage of network calls
2) Push: LongPull, Problem: for hot users, server has to push updated more frequently
3) Hybrid: pull for hot users and push for less number of follows

### Cache
- cache for photos on CDN
- cache for metadata, and LRU




