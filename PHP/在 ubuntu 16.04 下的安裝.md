# 在 ubuntu 16.04 下的安裝
apt-get update; \
apt-get install vim -y; \
apt-get install wget -y; \
apt-get install curl -y; \
apt-get install git -y;

# 安裝 nginx
apt-get install nginx -y; 

# 安裝 php (安裝的版本為 7.0)
apt-get install php -y; \
apt-get install php-pgsql -y; \
apt-get install php-mysql -y; \
apt-get install php-curl -y; \
apt-get install php-gd -y; \
apt-get install php-dom -y; \
apt-get install php-mbstring -y; \
apt-get install php-mcrypt -y; \
apt-get install php-soap -y; \
apt-get install php-sqlite3 -y; \
apt-get install php-xml -y; \
apt-get install php-xmlrpc -y; \
apt-get install php-zip -y; 


# 啟動 php-fpm
```
mkdir /run/php
echo "" > /run/php/php7.0-fpm.sock
ln -s /usr/sbin/php-fpm7.0 /usr/bin/php-fpm 
```
最後執行 : php-fpm

# 安裝 phalcon
https://docs.phalconphp.com/en/3.2/installation

- dep 
	- curl
	- gettext
	- gd2
	- libpcre3-dev
	- json
	- mbstring
	- fileinfo
	- openssl

apt-get install libpcre3-dev -y; \
curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash; \
apt-get update; \
apt-get install php7.0-phalcon;

查詢 : php -m | grep phalcon


# 源碼編譯 php(參考用)
wget -O php.tar.gz http://cn2.php.net/get/php-7.1.10.tar.gz/from/this/mirror
gunzip php.tar.gz
tar xvf php.tar

缺 configure 的方法