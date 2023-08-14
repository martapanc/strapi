#!/bin/bash

source .env.production

username="postgres"
host="containers-us-west-68.railway.app"
port="6492"
database="railway"

backup_dir="database/backups/"

# List available backup files
echo "Available backup files:"
backup_files=("$backup_dir"*.sql)
for ((i=0; i<${#backup_files[@]}; i++)); do
    echo "$((i+1)). ${backup_files[i]}"
done

# Prompt the user for backup selection
read -p "Enter the number of the backup to restore: " choice

# Validate user input
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -le 0 ] || [ "$choice" -gt ${#backup_files[@]} ]; then
    echo "Invalid input. Exiting."
    exit 1
fi

# Determine the selected backup file
selected_backup="${backup_files[$((choice-1))]}"

# Drop and recreate the database (uncomment if needed)
#PGPASSWORD="$PGPASSWORD" dropdb --username=$username --host=$host --port=$port $database
#PGPASSWORD="$PGPASSWORD" createdb --username=$username --host=$host --port=$port $database

# Restore the database from the selected backup
PGPASSWORD="$PGPASSWORD" psql --dbname=$database --username=$username --host=$host --port=$port --file="$selected_backup"
