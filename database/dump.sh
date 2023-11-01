#!/bin/bash

source .env.production

data_source="strapi-prod-db"
timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
output_file="./database/backups/${data_source}_${timestamp}_dump.sql"

PGPASSWORD="$PGPASSWORD" /usr/local/bin/pg_dump --file="$output_file" --create --clean --column-inserts --dbname=railway --schema=public --format=p --username=postgres --host=containers-us-west-68.railway.app --port=6492 --if-exists

export_file="./database/exports/${timestamp}_strapi-export"
export_pw="$EXPORT_PW"

echo "$export_pw" | strapi export --file "$export_file"
