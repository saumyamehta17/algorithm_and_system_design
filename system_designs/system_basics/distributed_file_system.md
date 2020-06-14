### Why we need?
Problem with single machine: 
- Single Point of Failure
- When files grow then we have to extend our machine, which could be very costly, So basically buying 10TB disk is expensive than buying 10 disks of 1TB all.
- Searching for file is also not much organized with billions of files
- Like File System like NTFS or FAT are there to handle data one machine but not across the machines.

### HDFS(Hadoop Distributed File System)
It splits massive files into small pieces called blocks. 

`default size of single block is 128MB`. 
`Default replication factor is 3`

**Name Node**
- act like a master
- knows file location on data nodes
- checks health of all data nodes. 
- as metadata, it knows which all nodes has copies of a file
- inform client about where to send request about replication
- handle failure of data node by replicating failed nodes to another

**Data Node** 
- where data is stored actually

#### Rack Awareness
A rack is collection of 30-40 nodes. Each replica should be in different rack to provide fault tolerance.

#### vs S3?
S3 is object storage not a file system. So 
Decision Parameters:
- Cost




