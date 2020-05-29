### In old days, CPU had one core

1 CPU core can only run one process at a time. but number of processes is not limited by the number of CPU cores. they are kept in memory. often Process waits for I/O or other calls, mean while instead of sitting ideal, OS switch to another process which are not waiting. Thus we usually have many more processes than CPUs. 

Actually Running
Being Executed
Being Active

one core can run one instruction set at a time

Steps:
Program/application is code which is stored on computer, program such as web browsing, emailing, playing music etc. Program typically stored on disk in a form that can be executed by computer. Prior to that they created with some languages. Then code is either compiled(converting to binary form in advance in order to run) or interpreted(converting to binary form at time of run) but end result is same. 

Compiler - which create a executable file(machine understandable file) and can tranfer to others.
 Advantage:
  Ready to run, source code is not public, 
 Disadvantages:
  platform-dependency(may be same executable file will not run on mac)

Interpreter - which sends source code instead and created executable code later when needed. 
Advantage:
  cross-platform
  simpler to test
Disadvantage:
  interpreter required
  source code is public, like javascript on web browser

When program is run then it is loaded into memory in binary form. Now these programs become active processes and now CPU will turn them into running process. There can multiple instance of this program loaded in memory but running instance is a process.

Then these process needs resources like:
Register - hold an instruction, storage address
Program Counter - keeps track where computer is in its program sequence
Stack - store info about sub-routines
Heap - dynamically allocated memory

Each process has separate memory space. They can not share data of each other process. Switching from one process to another do: saving and loading register, memory maps etc

Thread is unit of execution within process/application(Multithreaded Process). Threads will have their own stack and register but share same memory/heap and will share data(heap). Problem can occur when access to shared resources is not properly controlled. Data corruption is a common side effects of having more than one threads simultenously write to same block of memory.

There two types of threads: 
1) System level/ Kernel level threads - starting point of application
2) User level/application level threads 

Monitors and Semaphores (synchronization contructs)
Application threads use these to protect the shared resource. Both exist to achieve similiar goals. Thread synchronization does not come for free, it take time to acquire and release locks.

Example: A couple withdraw money from same account at same time. If withdraw block is not synchronized then both users will enter their at same time and money will be deducted twice but reported once.



Deadlocks
when threads need to acquire two locks before proceeding. But two threads acquired them in different order.


Do process share memory?
How CPU scheduling works?
	

Busy Waiting and how it can be avoided?
if threads waits for another thread to complete because some sort dependency between two. then first thread is active but only waiting for 2nd thread, in this way it still stealing CPU cycle for itself and doing nothing. This CPU cycle should be used for some real work instead. So, it can avoided by using 'wait' and 'notify' where 1st thread can sleep and 2nd thread can notify 1st thread when its done.
Example: Producer and Consumer	




In one core, CPU is shared among process and use process scheduling algo that divides CPU time. Time given to each process is 'time slice'


https://www.backblaze.com/blog/whats-the-diff-programs-processes-and-threads/


### Hard Disks
this is collection of blocks and blocks contains records. We keep data in disks to make it persistent and to avoid losing data when power off by not keeping it in RAM.

Whenever there is query to CPU, then RAM have to bring blocks in RAM and check whether there is desired data, if not it will bring another block and so on. This process has high I/O costs. Indexes reduces I/O costs

Given hard disk, where block size = 1000 bytes
each record takes = 250 bytes
total records are = 10000
if blocks are **unordered**, then what is average time complexity to search a record from HD?

number of records in block = 1000/250 = 4 records
No of blocks needed = 10000/4 = 2500 blocks 
best case = 1, which mean it find in first block
worst case = 2500, which mean record was in last block
average = 2500/2 = o(n/2) = o(n) = linear complexity

what if blocks sorted: then it will do o(log(n)) = log(2500) = 12
Index table is also saved on disk and bring into RAM when required. Data in RAM also sorted. Index table will have key and pointer(which point to a block on disk)

Dense -> number of entries in actual table and index table will be same. This mean we will have 10k entries as per above example.
Sparse -> leader(one record from a block) can be added to index table instead of all. Here we will have 2500 as per blocks count. But data has to be sorted.

#### calculation with sparse indexes
```
total records =  2500
size of entry in records = key(10B) + value(10B) = 20B
each record will take = 20B
block size = 1000 bytes
then number of records in block = 1000/20 = 50
total blocks = 2500/50 = 50 blocks

complexity is = log(50) = 6 + 1(because 6 will take you to desired block somewhere on disk where actual data is) = 7 because its sorted and binary search will work  
```

#### calculation with dense indexes

```
total records = 10k
then number of records in block = 1000/20 = 50
total blocks = 10000/50 = 200 blocks

complexity is = log(200) = 8+1 = 9
```

### How disk works
each block has some size for example: 512 bytes(0-511). We always read and write in terms of blocks.
To find specific address on disk, then we need track_number, sector_number, and this offset of block.

Disk is mounted on spinner and with head post. Spinner will change the track of disk and head will change sector to read or write.
Now when application is loaded in main memory(RAM), then its needs data. It bring data/blocks from disk in memory because data cannot be processed in disk. How data is managed in RAM, is datastructure.

### Multilevel index
as data grows, index(dense/sparse) table will also grows. It will reduce the number of blocks to be accessed. For example with dense: 

```
total records = 100k
then number of records in block = 1000/20 = 50
total blocks = 100000/50 = 2000 blocks

Make sparse indexes on this index table:
size of entry is same = 20B
take one record from block , then total entries will be =  2000
one block can hold = 50 entries
then total blocks would be = 2000/50 = 20 blocks
complexity is more less = log(20) + 1(index table lookup) + 1(actual table lookup)
```
**But we don't manage this multilevel index by own, it should be self managed. Then there is idea of B-tree/B+tree**

### M-way search tree 
its a extension of BST. or we can say BST is type of degree-2 of m-way tree. As in BST, we have root and smaller left child and bigger right children and searching in BST is very efficient.

Similarl y if we extend the idea, that we have 2 keys(k1 < k2) at any node  and 3 children. Where left children will be less than k1 and mid children lies b\w k1 & k2 and right children greater than k2.

which mean:
```
children = m
parent = m-1
so m-way, it can of anysize further
```

`Example of 4 way tree` which mean each node will have 3 keys
Now to use it indexes, we also need to have record pointer with each key along with children pointer.

`Problem with M-way`
There is no creation process for m-way. For example take degree 10(10-way) which mean 9 keys
```
data is like 10, 20, 30...n
how we gonna insert this, may 10 at root, 20 as 10's children, 30 again 20's children and so on
but this way it will have o(n) as height of m-way tree which is n 
```

So we need some guidelines to control m-way search tree. Here come B-tree which is m-way with some rules

### B-tree
Rules
- every node, you must fill half which is m/2 = 10/2 = 5, to controll the height of tree 
- Root can have min 2 children or 1 key
- All leaf at same level
- Creation process is bottom up
