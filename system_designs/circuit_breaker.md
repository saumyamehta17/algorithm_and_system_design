### Circuit Breaker Pattern

Widely adopted in micro services architecture. An Example of simple two microservices:
Backend and Front-end service. Client calling front-end, and backend is down or may be database called by backend is down.
The only sane solution is to **fail-fast**, front-end should be made aware that something has gone wrong on backend side and return failure to its own clients immediately.

It's basic function is to interrupt current flow after a fault is detected, then can be reset to normal flow when fault is solved back. Process Flow:
- If a call fails, increment the number of failed calls by one
- if the number of failed calls goes above thresold, open the circuit
- if the circuit is open, immediately return with error or default response.
- if the circuit is open and some time has passed, half-open the circuit
- if circuit is half-open, and next call fails, open it again
- if circuit is half-open and next calls succeed, close it.

#### Istio
a service mesh(dedicate infrastructer layer for service-service communication). Its a black-box way to open the circuit when things go wrong. Its pretty simple to setup.

#### Hystrix
- latency and fault tolerance library designed to isolate points of access to remote systems, 3rd party and services
- prevent cascading failures
- failing fast and recovery

for example: when catalog item is displayed, you call price/quota service. If its down, no price will be sent back and it won't be possible to order something.
A solution could be to cache prices returned by the price service when it is available, and return cached price when it is down.

Hystrix Circuit Breaker
```
allowRequest()
isOpen()
```

Hystrix Commands
```
run() # actual code to get prices
getFallback() # return cached prices
```


