#!/bin/bash

sleep 3
psql -h $1 -p $2 -U $3 -d $4 < ./data/sql/init.sql
psql -h $1 -p $2 -U $3 -d $4 -f ./data/sql/seed.sql
