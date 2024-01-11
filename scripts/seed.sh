#!/bin/bash
# -e Exit immediately when a command returns a non-zero status.
# -x Print commands before they are executed
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
sql_data_dir="$(dirname "$script_dir")/prisma"

sql_data_file="$sql_data_dir/data/data.sql"

echo ${sql_data_file}

set -ex
# Seeding command
psql -U auth_service_root -d auth_service_db -a -f ${sql_data_file}