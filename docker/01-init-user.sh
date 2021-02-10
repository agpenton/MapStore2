#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
    CREATE user geostore LOGIN PASSWORD 'geostore' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE;
    CREATE SCHEMA geostore;
    GRANT USAGE ON SCHEMA geostore TO geostore ;
    GRANT ALL ON SCHEMA geostore TO geostore ;
    alter user geostore set search_path to geostore , public;
    CREATE user geostore_test LOGIN PASSWORD 'geostore_test' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE;
    CREATE SCHEMA geostore_test;
    GRANT USAGE ON SCHEMA geostore_test TO geostore_test;
    GRANT ALL ON SCHEMA geostore_test TO geostore_test;
    alter user geostore_test set search_path to geostore_test, public;
EOSQL
#psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
#    CREATE USER geostore;
#    CREATE DATABASE geostore;
#    GRANT ALL PRIVILEGES ON DATABASE geostore TO geostore;
#EOSQL
