#!/bin/sh
chown -R mysql "$MYSQL_DATA"

# TODO: Check if mysql already configured...
mysql_install_db --user=mysql

if [ ! -d "/run/mysqld" ]; then
  mkdir -p /run/mysqld
fi
chown -R mysql "$MYSQL_RUN"

cat << EOF > $MYSQL_INITFILE
USE mysql
FLUSH PRIVILEGES
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION
UPDATE user SET password=PASSWORD("$MYSQL_ROOT_PASSWORD") WHERE user='root'
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION
UPDATE user SET password=PASSWORD("") WHERE user='root' AND host='localhost'
EOF

if [ "$MYSQL_DATABASE" != "" ]; then
  echo "[i] Creating database: $MYSQL_DATABASE"
  echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci" >> $MYSQL_INITFILE

  if [ "$MYSQL_USERNAME" != "" ]; then
    echo "[i] Creating user: $MYSQL_USERNAME with password $MYSQL_PASSWORD"
    echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" >> $MYSQL_INITFILE
  fi
fi

chown  mysql "$MYSQL_INITFILE"
/usr/bin/mysqld --user=mysql --init-file=$MYSQL_INITFILE
rm -f $MYSQL_INITFILE

exec gosu mysql "$@"
