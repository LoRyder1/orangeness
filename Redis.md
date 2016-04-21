** Redis data types and abstractions

- Redis is not a plain key-value store, actually it is a data structures server, supporting different kind of values. What this means is that, while in traditional key-value stores you associated string values, in Redis the value is not limited to a simple string, but can also hold more complex data structures.

Securing Redis

By default Redis binds to all the interfaces and has no authentication at all. If you use Redis into a very controlled enviroment, separated from the external internet and in general from attacters, that's fine. 