And now let's compare the execution plans.

Compute the statistics for both tables.
```
ANALYZE ranking;
ANALYZE ranking_columnar;
```{{execute T1}}

Run the explain plan for both tables for a typical data-intense query. The query selects a few columns, reads many data and aggregates data.
```
EXPLAIN
select date_part('year', stream_date) as year, avg(no_streams)
from ranking
group by date_part('year', stream_date);

EXPLAIN
select date_part('year', stream_date) as year, avg(no_streams)
from ranking_columnar
group by date_part('year', stream_date);
```{{execute T1}}

The costs for the query on the columnar table are lower as expected. As mentioned at the beginning, columnar tables perform best for analytical, DWH-style, Data Lake-style, or data-intense workloads.

The "classical" row-oriented tables are still best for transactional/operational OLTP systems that read many columns (but a few rows) and insert/update/delete data.

You need to be also aware that cstore_fdw also has some limitations:
- no primary and no foreign keys,
- no partitioning support,
- no updates/deletes,
- no SIMD support.
