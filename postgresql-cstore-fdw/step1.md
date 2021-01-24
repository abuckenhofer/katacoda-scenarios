There exist many databases focusing on columnar analytical in-memory processing (e.g. Vertica, Exasol, Oracle IMDB, etc.).

These databases store data in columns instead of rows and therefore can compress data effectively. Other characteristics like index skipping or SIMD are explained in [the article](https://www.buckenhofer.com/2021/01/postgresql-columnar-extension-cstore_fdw/).

Columnar tables perform best for analytical, DWH-style, Data Lake-style, or data-intense workloads. Step 4 shows such a query. The "classical" row-oriented tables are still best for transactional/operational OLTP systems that read many columns (but a few rows) and insert/update/delete data.


PostgreSQL offers an extension called cstore_fdw. Detailled information about the extension is available on the github [cstore_fdw home page](https://github.com/citusdata/cstore_fdw).

You see the preparation of a docker container in the terminal on the right. The docker container runs PostgreSQL with cstore_fdw installed.

Wait for the prompt "postgres@...:/usr/src/dwh_course$": the environment is ready now. Start the PostgreSQL command line
```
psql
```{{execute T1}}
