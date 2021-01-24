The extension cstore_fdw is installed in the docker container but needs to be created in a database. Afterwards, the foreign data wrapper adds a foreign server that can be queried as the local PostgreSQL database.

The last statement switches off parallelism. Parallelism is not needed in this demo and simplifies the comparison of the execution plans later on.

```
CREATE EXTENSION cstore_fdw;
CREATE SERVER cstore_server FOREIGN DATA WRAPPER cstore_fdw;
SET max_parallel_workers_per_gather = 0;
```{{execute T1}}