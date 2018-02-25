#!/usr/bin/env sh

# comment user = mysql
sed -Ei 's/^(user)/#&/' /etc/mysql/my.cnf

# do changes to my.cnf
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "user = root" >> /etc/mysql/my.cnf
echo "performance_schema = 0" >> /etc/mysql/my.cnf #/etc/mysql/mysql.conf.d/mysq
ld.cnf
echo "key_buffer = 8M" >> /etc/mysql/my.cnf
echo "max_connections = 30" >> /etc/mysql/my.cnf
echo "query_cache_size = 8M" >> /etc/mysql/my.cnf
echo "query_cache_limit = 512K" >> /etc/mysql/my.cnf
echo "thread_stack = 128K" >> /etc/mysql/my.cnf
#echo "innodb_log_buffer_size = 8M" >> /etc/mysql/my.cnf

#echo "skip-innodb" >> /etc/mysql/my.cnf

#echo "show_compatibility_56 = 1" >> /etc/mysql/my.cnf
#echo "innodb=OFF" >> /etc/mysql/my.cnf
#echo "default-storage-engine=myisam" >> /etc/mysql/my.cnf
cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf
#mysql_install_db --user=root
mysqld_safe & \
 inotifywait -e create /var/run/mysqld/mysqld.sock

#sleep 3
tail -f /var/log/mysql/error.log &

while ! mysqladmin ping --silent; do
    sleep 1
