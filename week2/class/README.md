## Prerequisite 

### Log into PostgreSQL server and create a database pagila
### Use Cloud Shell to connect
CREATE DATABASE pagila;

### Restore data in PostgreSQL Database

### Upload pagila-schema-modified.sql and pagila-data.sql files to your Cloud Shell instance

pagila-schema-modified.sql and pagila-data.sql files are located in LoadData folder

### Create shemas
psql "--host=YOUR_HOST" "--port=5432" "--dbname=pagila" "--username=azureadmin" "--set=sslmode=require" < pagila-schema-modified.sql

### Load the data
psql "--host=YOUR_HOST" "--port=5432" "--dbname=pagila" "--username=azureadmin" "--set=sslmode=require" < pagila-data.sql 