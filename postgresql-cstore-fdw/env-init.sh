#!/usr/bin/bash

# run in forground

docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name columnarpostgresql abuckenhofer/columnarpostgresql:v1.3
docker exec -it columnarpostgresql bash

psql