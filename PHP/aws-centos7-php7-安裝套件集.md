# start
1. 至 aws
2. launch new instance
3. market search centos
4. choose centos7
5. yum update

# centos7 安裝 nginx

1. yum -y install epel-release
2. yum install nginx
3. 驗證在瀏覽器開啟 ip, 注意 port 80 是否有開啟

## 操作
/bin/systemctl restart nginx

# centos7 安裝 php7.x

1. yum install wget
2. wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
3. rpm -ivh ./remi-release-7.rpm
4. yum install --enablerepo=remi,remi-php70 php-fpm php-devel php-mbstring php-pdo php-gd php-xml php-curl php-mysqlnd php-pdo_mysql php-mysqli php-json php-soap php-zip php-sockets php-session php-mcrypt php-date php-openssl php-yaml

## source
1. 下載位置 http://php.net/downloads.php
2. 可參考目前的 ext
3. 手動新增 ext, ex:
	1. cd xml
	2. phpize
	3. ./configure
	4. make && make install
4. 查看 module 是否有此套件

## 操作
/bin/systemctl restart php-fpm

## 測試

1. 找出 nginx.conf : nginx -h
2. vi {$path}/nginx.conf
3. server 設定參數可參考 `https://docs.phalconphp.com/zh/latest/reference/nginx.html`
	- 請將 fastcgi 設定為 127.0.0.1:9000 <--- 必須符合 php-fpm 的 listen 位置
4. 在適當位置建立 <?php phpinfo()?> 的 index.php
5. 在 browser 輸入 ip 與 index.php

# centos7 安裝 phalcon with php7.x

1. yun install git
2. yum install php-devel pcre-devel gcc make re2c
3. 安裝編譯工具 : git clone https://github.com/phalcon/zephir
4. cd zephir/
5. ./install-nosudo
6. 下載 phalcon source : git clone git://github.com/phalcon/cphalcon.git
7. cd cphalcon/
8. git checkout 適當的版本
9. {$Path}/zephir build
10. 將 extension=phalcon.so 放入 php.ini
11. php -i | grep phalcon

## trouble
- undefined symbol: php_json_decode_ex in Unknown on line 0
	- 原因在於此 extension=phalcon.so 不能直接放在 php.ini 中，請放置 /etc/php.d/

# centos7 安裝 libmemcached 編譯 memcached.so

## 安裝 libmemcached

1. 至官網下載 https://launchpad.net/libmemcached
2. wget ....
3. cd /libmemcached-1.x.x
4. yum groupinstall "Development Tools"
5. yum install zlib-static
6. ./configure
7. make && make install

## 編譯 memcached.so
1. git clone https://github.com/php-memcached-dev/php-memcached.git
2. git checkout php7
3. phpize
4. ./configure --disable-memcached-sasl
5. make && make install
6. 確定是否將 .so 放入 module 中 : 
	1. `php -i | grep extension_dir`
	2. cd {dir}
	3. 檢查是否有 memcached.so
7. 確定 extension 是否有加入到 php.ini
8. 驗證 php -i | grep memcached

# centos7 安裝 libmosquitto 編譯 mosquitto.so

## 安裝 libmosquitto
1. 進入官網 : https://mosquitto.org/download/
2. 找到 centos7 的 re 的 conf
3. 將檔案 mosquitto.repo 放入 /etc/yum.repos.d 即可
`The available packages are: mosquitto, mosquitto-clients, libmosquitto1, libmosquitto-devel, libmosquittopp1, libmosquittopp-devel, python-mosquitto.`
4. 安裝 : yum install libmosquitto-devel
5. 安裝後的 lib 路徑, 系統安裝後會提示, 無意外是 /usr/lib64/libmosquitto.so.....

## 編譯 mosquitto.so
1. 下載 git source 後 : https://github.com/mgdm/Mosquitto-PHP
2. cd Mosquitto-PHP
3. phpize
4. `./configure --with-mosquitto=/usr/lib64/libmosquitto.so`
5. make && make install
6. 驗證 module 是否有 mosquitto.so
7. 在 php.ini 中設定 extension=mosquitto.so
8. 驗證 : php -i | grep mosquitto

# centos 開啟服務 by SELinux

- 查詢服務器服務開放狀態 : getsebool -a
- 查詢目前 httpd 開啟的服務 : /usr/sbin/getsebool -a | grep httpd
- 開啟
	- sudo setsebool -P httpd_can_network_connect_db 1
	- sudo setsebool -P httpd_can_network_memcache 1
	- sudo setsebool -P httpd_can_network_connect 1
	
# 發生無法寫入檔案 : failed to open stream: Permission denied

{dir} : 要開啟的 dir 位置
chcon -R -t httpd_sys_script_rw_t {dir}

# nginx 發生 無法啟動，conf port 設定無權限

`nginx: [emerg] bind() to 0.0.0.0:100 failed (13: Permission denied)`
設定 100 port，權限無法 map 的問題
1. 檢查目前支援的 port : `semanage port -l | grep http_port_t`
2. 加入要監聽的 port : `semanage port -a -t http_port_t  -p tcp {new_port}`
	
	