#Redis data types and abstractions

Redis is not a plain key-value store, actually it is a data structures server, supporting different kind of values. What this means is that, while in traditional key-value stores you associated string values, in Redis the value is not limited to a simple string, but can also hold more complex data structures.

#Securing Redis

By default Redis binds to all the interfaces and has no authentication at all. If you use Redis into a very controlled enviroment, separated from the external internet and in general from attacters, that's fine. 

# How to take advantage of Redis just adding it to your stack

Redis is different than other database solutions in many way: it uses memory as main storage support and disk only for persistence, the data model is pretty unique, it is single threaded and so forth.

At times Redis can be used as primary database. Redis can do things that were too slow or impossible with your existing database. This way you start to take confidence with Redis in an incremental way, starting to optimize or to create new features in your application. 

---

To have listings like like 'latest items added by our users' or 'latest something else' in web apps is very common, and often a scalability problem. It is pretty counter intuitive that you need to sort stuff if you just want to list items in the same order they were created. 

#Redis Persistence

The OS and the disk

1. The client sends a write command to the database (data is in client's memory)
2. The database receives the write (data is in server's memory)
3. The database calls the system call that writes the data on disk (data is in the kernel's buffer)
4. The operating system transfers the write buffer to the disk controller (data is in the disk cache)
5. The disk controller actually writes the data into a physical media (a magnetic disk, a Nand chip, ...)

##Persistence done in two ways
  1. snapshotting, and is a semi-persistent durability mode where the dataset is asynchronously transferred from memory to disk from time to time, written in RDB dump format.
  2. the safer version is AOF, an append-only file ( a journal) that is written as operations modifying the dataset in memory are processed. Redis is able to rewrite teh append-only file inthe background in order to avoid an indefinite growth of the journal.












