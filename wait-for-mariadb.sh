#!/bin/bash
# wait-for-mariadb.sh

set -e

cmd="$@"

>&2 echo "Waiting for database to be ready"
until mysql -h ${DB_HOST:-db} -u ${DB_USER:-passbolt} -p${DB_PASS:-P4ssb0lt} -P ${DB_PORT:-3306} ${DB_NAME:-passbolt} -e "show tables;" > /dev/null 2>&1; do
  sleep 1
done

exec $cmd
