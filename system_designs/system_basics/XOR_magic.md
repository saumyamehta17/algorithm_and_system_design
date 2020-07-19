## XOR, logical Exclusive-OR

### What
- different bit = 1
- same bit = 0

### Use Cases

- Checksum
checksum, helps to check whether the file is corrupted or hampered. Any file like mp3, jpeg when transmit from one machine to another ofcourse in binary form, can be changed and can be verified by checksum.
file is transmitted from server A to B in chunks and then re-assembled at destination.
Example: 'he' is passing to another server in chunks.
```
h -  01001000
e -  01000101

checksum = 00001101
``` 

Lets say server received "hhe"
```
h -  01001000
h -  01001000
e -  01000101

checksum = 01000001
``` 
- RAID Driver Backups
How do you backup? using 1:1 mapping, which mean for 1 disk you will backup to another disk
which mean for 300 disk you would need 300 backup disks

How XOR helps here to reduce number of backup disk needed

for given 300, you can have 100 backup disk, like follow:
```
Server 1, holds one file with text 'Hello'
Server 2, holds one file with text 'Hi'
Server 3, holds one file with text 'Saumya'
```

if server1's backup disk crashed, then it can be reconstructed with other 2 server and 1 XOR'ed disk bits

```
1   = 0001
2   = 0010
3   = 0011
-----------
XOR = 0000
-----------
if 1 crashed, then do XOR of

2   = 0010
3   = 0011
XOR = 0000
----------
1   = 0001
----------
```
https://medium.com/@claireli_ultron/applicable-uses-of-the-xor-operator-3e0fcc9bf9cb
