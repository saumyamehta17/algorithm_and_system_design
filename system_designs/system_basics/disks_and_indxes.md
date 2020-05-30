### Hard Disks
this is collection of blocks and blocks contains records. We keep data in disks to make it persistent and to avoid losing data when power off by not keeping it in RAM.

Whenever there is query to CPU, then RAM have to bring blocks in RAM and check whether there is desired data, if not it will bring another block and so on. This process has high I/O costs. Indexes reduces I/O costs

Given hard disk, where 
```
block size = 1000 bytes
each record takes = 250 bytes
total records are = 10000
```
**If blocks are unordered, then what is average time complexity to search a record from HD?**

```
number of records in block = 1000/250 = 4 records
No of blocks needed = 10000/4 = 2500 blocks 
best case = 1, which mean it find in first block
worst case = 2500, which mean record was in last block
average = 2500/2 = o(n/2) = o(n) = linear complexity
```

what if blocks sorted: then it will do o(log(n)) = log(2500) = 12
Index table is also saved on disk and bring into RAM when required. Index table will have key and pointer(which point to a block on disk)

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
[image here](https://drive.google.com/file/d/1-RPD4OcvAOd5yEQNeO4HPh5A7DMiX0zb/view)

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
Now to use it in indexes, we also need to have record pointer with each key along with children pointer.

`Problem with M-way`
There is no creation process for m-way. For example take degree 10(10-way) which mean 9 keys
```
data is like 10, 20, 30...n
how we gonna insert this, may 10 at root, 20 as 10's children, 30 again 20's children and so on
but this way it will have o(n) as height of m-way tree which is n 
```

So we need some guidelines to control m-way search tree. Here come B-tree which is m-way with some rules

### B-tree
Rules are:

- every node, you must fill half which is m/2 = 10/2 = 5, to controll the height of tree 
- Root can have min 2 children or 1 key
- All leaf at same level
- Creation process is bottom up

each b-tree node will have pointer which will point to another index_table/ or actual table.

### B+ tree
all nodes are present in leaf nodes. Record pointer only exist in leaf nodes. All leaf nodes form a linkedlist