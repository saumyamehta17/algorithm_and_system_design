### FR
- User can upload video, download the video
- User can search video
- Maintain view counts
- User can like and comment on video
- User can subscribe to channel

### NFR
 Reliable, available, scabale, low latency

### Estimation

```
Total Users = 100 Billion 
DAU = 10 Million, per user video read = 5
1 day total video reading = 50 Million
1 sec = 50M/86400 = 5000/9 ~= 555 videos

if ratio is 1:100
Video size = 100KB, 1 day = 50M/100 = 5k*100KB = 500GB
10 Years = 500GB*10*365 = 1825TB = 1.8PB
```

### Modeling/Schema Design:

User table: id, name, email_address, dob, reg_date
Channel_table: id, name, user_id, description
Subscribe: user_id, channel_id
Video_table: id, user_id, channel_id, title, description, size, format, video_path, thumnail_path, likes
Comment_table: id, text, user_id, video_id

DB: Relation Database is fine.  

### Api Design:
GET api/v1/search?keyword=”amazon”
POST api/v1/upload, params = {video: content, name: , description: }

stream_video(video_id, codec, resolution, offset)
	codec is a phase when service will encode the video in multiple formats and saved as different codec info 

### Components
This service has to create different formats which is combination of codec formats * resolutions
codec = high_quality(mp4), medium_quality(avi)
resolution = 1220p, 720p
in all FxR = 2 x 2 = 4 formats.

Now, creating these lot of formats will take time and Netflix divides whole file in chunks and then create a tuple(F, R, chunk)

`Problem` is dividing these chunks based on some fixed size may be size is few minutes. Then user experience could go wrong. For example: in the end of one chunk, an interesting scene is going on and new api call happened and there is a lag. Nooooooo

Then divide file into scenes? How?

Also 90% of traffic are handled by **OpenConnect**(boxes placed near by ISP by Netflix, CDN owned by Netflix)

#### Thumbnails
cache hot thumbnails for improving latency

### Sharding

#### Based on user_id
give user_id to hash function and this give us that server. 
`Problem`
- what if this user become so popular then lot of load will come to this server.
- what if this uploading lot of videos than others
- which leads to Ununiform data distribution

#### Based on video_id
hash function will take video_id and tells which server holds this video. Then if there is query that "get all videos of this user" than all servers will be asked and each will return set of videos. Then central server will aggregate and rank the results then returns to user.

### Video Deduplication
videos can be different with just few changes like(aspect_ratios, Adjusted the speed/volume). Still video should be duplicate because of following reason:
1) Infringe Copywrite
2) wastage of storage space
Inline deduplication will save lot of resources like transcoding, storage, transfer etc. So, youtube used content_id(content identification) technology

### Cache for metadata servers to cache hot db rows
### CDN for popular videos, to place videos closer to the user
### Bigtables









