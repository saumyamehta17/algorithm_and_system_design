### OSI Model
Layers/Network Stack
1. Physical
2. Data Link
3. Internet Protocol(IP)
4. Transport Control Protocol(TCP)
5. Application

7. Application
6. Presentation
5. Session
4. Transport
3. Network
2. Data Link
1. Physical

#### Firewall
security gateway, which reject or pass network communication b\w two networks(trusted/private network and public/outside/internet)

Three common types of firewall:
1) Packet-filtering - applies rules of each incoming IP packets
Primarly done at network layer(layer 3) or transport layer(layer 4). Unknown traffic is only allowed till layer 3. It has rules based on following variables:
- Source and Destination IP Address
- Protocol(TCP/UDP)
- Source and Destination Port
2) Circuit-level - monitor TCP/UDP sessions specific rules, operates at transport layer and session layer
once session is validated, then it opens port to allow all other packets belonging to that session to pass. It maintains circuit table to store the connection details of successful connections
3) Application-level Gateway/ Proxy Server - Rules based on application features

### Protocols

HTTP - is a application layer protocol, rely on lower level protocol i.e TCP/UDP