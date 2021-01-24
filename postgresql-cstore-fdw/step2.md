The extension cstore_fdw is installed in the docker container but additionally needs to be created in a database. The first statement creates the extension in the current database.

Afterwards, the foreign data wrapper adds a server that can be queried as the local PostgreSQL database. The server gets the name cstore_server which is later required for table creation.

The last statement switches off parallelism. Parallelism is not needed in this demo and simplifies the comparison of the execution plans later on.

```
CREATE EXTENSION cstore_fdw;
CREATE SERVER cstore_server FOREIGN DATA WRAPPER cstore_fdw;
SET max_parallel_workers_per_gather = 0;
```{{execute T1}}