#!/bin/bash
set -e

IFS=',' read -r -a dbnames <<< "$POSTGRES_DATABASES"
for dbname in "${dbnames[@]}"
do
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $dbname WITH ENCRYPTED PASSWORD '$dbname';
    CREATE DATABASE $dbname;
    GRANT ALL PRIVILEGES ON DATABASE $dbname TO $dbname;
EOSQL
done