#!/bin/sh
chown -R mysql "$MYSQL_DATA"

# if [ -z "$(ls -A "$MYSQL_DATA")" ]; then
#     gosu postgres initdb
#     # sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$MYSQL_DATA"/postgresql.conf
#
#     : ${MYSQL_USER:="mysql"}
#     : ${MYSQL_DATABASE:=$MYSQL_USER}
#
#     if [ "$MYSQL_PASSWORD" ]; then
#       pass="PASSWORD '$POSTGRES_PASSWORD'"
#       authMethod=md5
#     else
#       echo "==============================="
#       echo "!!! Use \$POSTGRES_PASSWORD env var to secure your database !!!"
#       echo "==============================="
#       pass=
#       authMethod=trust
#     fi
#     echo
#
#
#     if [ "$POSTGRES_DATABASE" != 'postgres' ]; then
#       createSql="CREATE DATABASE $POSTGRES_DATABASE;"
#       echo $createSql | gosu postgres postgres --single -jE
#       echo
#     fi
#
#     if [ "$POSTGRES_USER" != 'postgres' ]; then
#       op=CREATE
#     else
#       op=ALTER
#     fi
#
#     userSql="$op USER $POSTGRES_USER WITH SUPERUSER $pass;"
#     echo $userSql | gosu postgres postgres --single -jE
#     echo
#
#     { echo; echo "host all all 0.0.0.0/0 $authMethod"; } >> "$PGDATA"/pg_hba.conf
# fi
#
# exec gosu postgres "$@"
