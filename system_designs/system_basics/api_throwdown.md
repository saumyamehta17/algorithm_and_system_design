### API Throwdown

Mircoservices must exchange data and need to agree on:
1) Api to exchange the data
2) data format
3) error patterns

- Api can be Rest or Http-Json or RPC
- Also need to think about data model: JSON, XML, Binary
- Also need to think about endpoints
- Also need to think about effecieny(too much data, too little data - too many calls)
- Latency
- Scalability
- Inter operatbility with many languages
- authentication, monitoring, logging
What is one framework which can solve everything above: Which is **gRPC**

#### gRPC, also a RPC by Google
build on top of HTTP/2

#### RPC

function as an api or calling function on server, frameworks are like Thrift(FB), ProtoBuf(Google), Avro(Apache).

In your client code, it looks like you'r just calling a function on server
client code(any language)
```
{code}
.....
server.create_user(params)
{code}
```
server code(any other language)
```
def createUser(params){...}
```

We would have RPC server and stub in multiple languages, that is given by framework like gRPC. At core of this, we need to define messages and service in protocol buffers:

**Why Protocol Buffers**
- language egnostic
- Data is binary (small payloads)



looks like:
```
listConversation()
listMessages(conversion_id)
```

- Benefits:

	Its easy to add new function to RPC Api
	LightWeight Payloads
	

- UseCase:

For low overhead messages. When you have large microservices internal and they comminicate millions and billions times a day , you don't want network over-head , you want messages to be small.

- Problems: 
	Tight Coupling

#### REST 

resources as an api 

- Benefits:
decoupling client and server, reuses http(http verb, cache semantic, content negotiation) http toolbox, self-documented

- Problems: 
 Big Payload

#### GraphQL 
instead of modeling functions and resource, here deal with query. It returns exactly what client want.Following GET call only cares about title and text:
```
query {
	listConversations {
	  title,
	  messages{ 
	   text}
	}
}
```
POST call
```
mutation {}
```

- Benefits: 
Low Network over-head
typed schema
- Problems: 
 complex
 caching