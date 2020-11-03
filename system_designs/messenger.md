## Chat Service like FaceBook and Whatsapp Do

### Req
- online state?
- message read or sent ?
- maintain chat history
- send objects?
- group conversation or just 1:1 ?

### Estimation
assume average msg size = 200 chars
200 chars * 1B message a day =~ 
200 Bytes * 1B =~ .2*1PB = 200TB
and 10 years

### Goals
Latency - MUST
Availability - Good to have
Consistency - MUST

### API
POST send_message(sender_id, receiver_id, content, timestamp)
GET  fetch_conversations()

### Schema
### Communication Protocol

- HTTP, Server can not initiate the http request, so can not be used for our chat service
- WebSocket - is a bi-directional connection, and has sticky session. Both Client and Server can initiate requests.
- BOSH - its over http. Client send requests, and server hold this request for some time.
- Long Poll HTTP
