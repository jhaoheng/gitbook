MAMP, PHP 7.0.8, MONGODB

brew install mongodb

cd /Applications/MAMP/bin/php/php7.0.8/bin

sudo ./pecl install mongodb


# Q

- pecl compile happen : `'openssl/sha.h' file not found` 
	1. brew install openssl
	2. cd /usr/local/include
	3. ln -s ../opt/openssl/include/openssl .
	4. sudo ./pecl install mongodb

# 如何使用

請參考 mongodb folder

1. 必須先啟動 deamon