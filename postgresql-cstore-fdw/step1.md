There exist many databases focusing on columnar analytical in-memory processing (e.g. Vertica, Exasol, Oracle IMDB, etc.).

These databases store data in columns instead of rows and therefore can compress data effectively. Other characteristics like index skipping or SIMD are explained in [the article](https://www.buckenhofer.com/2021/01/postgresql-columnar-extension-cstore_fdw/).

PostgreSQL offers an extension called cstore_fdw. A docker container is prepared in the terminal. The docker container runs PostgreSQL with cstore_fdw installed.

As soon as the environment is ready, start the PostgreSQL command line
```
psql
```{{execute T1}}