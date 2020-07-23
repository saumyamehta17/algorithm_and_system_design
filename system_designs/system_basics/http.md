## HTTP

- Enter www.google.com, what happens
request - modem - ISP - google server - response
search for IP address of site name
w.x.y.z = each num 0-255(256), 32 bits in total -> possible IP address 2**36 = 4 Billion
But lots of devices these days, run out of IP address, so there is 128 bits v6

- DNS lookup
your dns server - ISP server - other DNS fishes - root DNS server
once my computer knows about IP, then it create a message like:
GET / HTTP/1.0
http://www.google.com/
Protocol, subdomain name, domain name, TLD top level domain name, path
single '/', get me root of hard drive

