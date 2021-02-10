### Feature set(2 Min)
  - Tweeting
  - Timeline(where user can see tweets of whom he follows)
  - Follow & Followers
  - Search a tweet
  #### Other
  - advertisements
  - Mention & tags
  - Trending Tweets
  - Notification System

### Estimation(5 min)
  - How many writes(lets assume 100M DAU writes around 5 tweets, leads to 500M tweets per day)
  - How many reads(reads depend upon how many followers a user have)
  - How important Latency is?
  - How important Consistency is?
  - How important Availability is?
  
### API(5 min)
  - Post a tweet
    postTweet(userId, content, timesstamp)
  - POST follow a user
    follow(userId, toFollowUserID)  
  - GET Feed
    getTweets(userId, offset, deviceinfo)
  - search a tweet



* How to serve feeds on user's timeline
	if user follows many people, then fetching feeds and rendering them can be costly.
	Sol: as scroll is there, so we dont need to fetch all feeds at once. We can fetch N feeds.

	Query would be
	Give me all tweets to whom I follow and merge them in cronological order. This is very huge select query which happens every time when someone opens twitter. 

	Availability more matters 
	so, as soon as user post/put tweet, Load Balancer will distribute them in 3 redis(in RAM, not in disk) cluster. Redis machines have lists for each user. Obviously there are many redis machines, here load balancer do hash lookups to find correct redis machine for followers.

	Now, when user do GET request,
	Browser gonna ask load balancer, and LB check redis machine and then check user's list in redis. one redis machine out of three will respond.

* Ranking of feeds:

* Scale the system:	

### High Level Design/Deep Dive(20-30 min)
    - on Application Layer? How would you fault tolerance: when one server dies
    - on Database Layer? What type of data it has? then which DB RDBMS or NoSQL?
     : For our use, joins are required, where NoSQL is not efficient as it store data in denormalized form.
     : Can all our data fit in single machine for x number of years, see below
     ### Data Model
     	Que: which Database and why
         What we need to store?
           User - name, email, dob, registration date = 
           Tweet - user_id, content, timestamp = (1 byte + 100 chars + 1 byte = 102 bytes)
           Follower - user_id, follows_id, timestamp = (2 bytes+2 bytes+1 byte = 5bytes)
     Now if we use RDMS, and with huge data, how we sharding?
     - shard on user_id? To provide feed for user, it would require communication from many shards.
     - shard on timestamp of tweet? Users mostly interested in most recent tweets, we can keep users in one shard. Mostly
        this approach would require comm with two shard.
     - HYbrid Approach - add recent tweets in cache
     - If too many updates for update tweet to be faviourit can chok our machine. Better batch update in favourite table.
        keeps updates in queue and the update db         
