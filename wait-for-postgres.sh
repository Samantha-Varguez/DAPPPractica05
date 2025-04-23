#!/bin/sh

host="$1"
shift

echo "Waiting for postgres at $host..."

until nc -z "$host" 5432; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec "$@"

