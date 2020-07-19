### Scaling RDBMS

- <del>its not scalable</del>
- its hard to scale

#### What exactly needs to scale?

1) Tables (Data) - how to partition data, indexes, foreign_keys, constraints
2) SQL (Reads) - sql queries once data is distributed
3) Transactions (Writes) - transactions across nodes(also nodes can fail)

#### Replication/Sync Databases(SQL)

- Data generally live in single machine, then no problem
- Taking backup of data is no problem, we also don't keep running all the time.
- But if you have primary and secondary , expectation is secondary should be updated, but there are problems

  - Stale data on read replicas
  - Data lose
  
- Primary/Secondary Replication, two ways

    - Asynchronous Replication, Secondaries lag behind primary and failover is likely to lose recent writes
       
    - Synchronous Replication, all writes get delayed and network delay and how long our user needs to wait.
    
#### Atomicity
one disk write fully succeed or fully fail.
 
How Postgres achieve atomicity: Every part of transaction is written to disk with transaction_id and not visible to read as marked as transaction. When you go and commit this transaction and it writes to **commit logs** where atomicity comes in.

#### Isolation
Read/Write Locks
MVCC -> multi version concurrency control, store timestamp on each row.   


### In Nosql, there no transactions at all. - Distributed Transactions
- Because transactions applies coordination and coordination is hard in distributed system. We can just get one single key to operate on.
- Distributed Transaction(Cockroach DB)
  - One can achieve Atomicity in the same way by applying transaction_id and status to operations, to read the data it could check the transaction status
  - Of course it comes with overhead of removing this transaction_id , if status is **committed** now.
  - There could be conflicts, that transaction_2 started and working on same operation, then solutions could be, 1) wait for first one to finish, 2) abort first one



