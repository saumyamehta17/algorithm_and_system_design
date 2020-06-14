### Scaling RDBMS

- <del>its not scalable</del>
- its hard to scale

#### What exactly needs to scale?

1) Tables (Data) - how to partition data, indexes, foreign_keys, constraints
2) SQL (Reads) - sql queries once data is distributed
3) Transactions (Writes) - transactions across nodes(also nodes can fail)