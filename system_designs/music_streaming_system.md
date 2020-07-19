### FR
- User can search track by singer_name, title, released_time
- User can listen track, also can off-play
- uploads track
- As money is paid to artist, so detect fraud streaming
- User can create their playlist
- Track Recommendation
- like, share tracks
- track recogination by Shazam, to search song even we don't know it.

### NFR
- Scalable
- No track loss, reliable

### Estimation

```
100 Billion Tracks
1    Track = 4KB
100B Track = 4TB of data

1 Billion users
1  user = 10 tracks a day
1B user = 10Billion tracks stream a day
1 sec = 100000000000/86400 = 1.1 Million  
```

### Read Heavy Application

### Api Design
/api/v1/search_track?keyword="the_life"
/api/v1/listen?track_id=123

### How audio/video streams
Just like humans talk to each other and mind decode the chat to make it understandable for human. Similarly machine/device will encode the audio in binary format and
send it to another user in electronic waves and another user then decode it using some audio / video players who help computer to decode the info and present for user.

Which protocol is being used while streaming??




