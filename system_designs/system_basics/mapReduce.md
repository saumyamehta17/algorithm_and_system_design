### Map Reduce in Hadoop

### Distributed Computation with Hadoop
its pretty easy when we have system, and then going in multiple threaded way, it could be terrible.
But when you want to distribute computations over multiple computers, life become truly terrible. But we have tools for this **Map Reduce**

Map: which will give all words in file, like: a: 1, cat: 1, a: 1
Shuffle: which we shuffling over the network on these words so that similiar words would in near by each other. Then collecting these words and dump into reduce.
Reduce: It will add up the numbers 

MapReduce is the pattern by Hadoop 
- can work with HDFC

### Distributed Computation with Spark
It has scatter/gather paradigm similar to MapReduce.
- Storage agnostic, it can work on cassandra/HDFC 
- give you an object, more developer friendly

#### Example - Word Count
Lets say that our given file is 200MB in size. And Hadoop has 64 MB per block then we will have 4 blocks.
File Image here

And one block of this file might be save in one data node, 2nd block might be saved in third data node or nth data node.

number of file splits = number of mappers

Hadoop can run your program in form of **key, value** format only. So also mapper and reducer also works with key,value pair. So we have to convert these lines in file into key, value form. So we have record_reader for each split. This is handled by Hadoop framework. Record reader is only reading one line at a time. Mapper will run n number of times, n is number of lines in your file spliter.

Reducer will combine all **key, value** pairs. But reduce should have unique keys. So there is another phase in between which is Shuffling and sorting

`Shuffling and sorting`
It will collect duplicate keys, and make it like:
(how, [1,1,1,1])

Then one key and value will be given to reducer at a time.