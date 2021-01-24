Now the environment is ready to create tables.

First let's create a "normal" table (row-oriented table). The table is called ranking and contains several columns.

```
CREATE TABLE ranking
(
   rank integer,
   track_id varchar(32),
   artist_id integer,
   no_streams integer,
   url character varying(200),
   stream_date date,
   region character varying(10)
);
```{{execute T1}}

An now create a columnar table called ranking_columnar. The create table command is the same as above except
- contains the key word "foreign"
- uses the server "store_server" created the step before
- defines compression

```
CREATE FOREIGN TABLE ranking_columnar
(
   rank integer,
   track_id varchar(32),
   artist_id integer,
   no_streams integer,
   url character varying(200),
   stream_date date,
   region character varying(10)
)
SERVER cstore_server
OPTIONS(compression 'pglz');
```{{execute T1}}

Now load some data into the tables. The data is available in the docker container in directory /usr/src/dwh_course/sourcedata/spotify.

```
COPY ranking
FROM '/usr/src/dwh_course/sourcedata/spotify/ranking.csv' DELIMITER ',' CSV HEADER;

COPY ranking_columnar
FROM '/usr/src/dwh_course/sourcedata/spotify/ranking.csv' DELIMITER ',' CSV HEADER;
```{{execute T1}}
