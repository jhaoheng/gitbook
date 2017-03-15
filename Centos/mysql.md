# Env

centos7

# souce repo

rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm

# flow

1. yum install mysql-community-server
2. 開機自動執行 : /usr/bin/systemctl enable mysqld
3. 啟動 mysql : /usr/bin/systemctl start mysqld
4. 變更 mysql 密碼 : /usr/bin/mysql_secure_installation