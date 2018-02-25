#!/usr/bin/env sh

cd /temp/
#echo "[mysqld]" >> /etc/mysql/my.cnf
# {
#  mysqld_safe --no-defaults --user=root --datadir='/tmp/mysql/data' --socket='/
tmp/mysql/socket/mysqld.sock' &
#  inotifywait -e create /tmp/mysql/socket
#} 1>/dev/null 2>/dev/null

echo "[mysqld]" >> /etc/mysql/my.cnf
#echo "user = root" >> /etc/mysql/my.cnf
echo "performance_schema = 0" >> /etc/mysql/my.cnf #/etc/mysql/mysql.conf.d/mysq
ld.cnf
#echo "show_compatibility_56 = 1" >> /etc/mysql/my.cnf
#echo "innodb=OFF" >> /etc/mysql/my.cnf
#echo "default-storage-engine=MyISAM" >> /etc/mysql/my.cnf
cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf
mysql_install_db --user=root
service mysql start

#echo "----BEGIN-----"
mysql -u root -e 'CREATE DATABASE main'
mysql -u root main < file.sql # > outputFile
#echo "----END----"


#####

#!/usr/bin/env sh

mkdir -p /tmp/mysql/data
mkdir -p /tmp/mysql/socket
chown -R root /tmp/mysql

#mysql_install_db --user=root --datadir=/tmp/mysql/data

mysqld_safe --no-defaults --user=root --datadir='/tmp/mysql/data' --socket='/tmp
/mysql/socket/mysqld.sock' \
& inotifywait -e create /tmp/mysql/socket
sleep 3
