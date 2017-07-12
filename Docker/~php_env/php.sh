#!/bin/sh

yum install -y wget
yum install -y gcc
yum install -y libxml2-devel
yum install -y openssl openssl-devel
yum install -y bzip2-devel
yum install -y curl-devel
yum install -y libjpeg-devel
yum install -y libpng-devel
yum install -y libXpm-devel
yum install -y freetype-devel
yum install -y gmp-devel 
yum install libmcrypt libmcrypt-devel -y
yum install -y mysql-devel 
yum install -y aspell-devel
yum install -y recode-devel

url=http://tw1.php.net/get/php-7.1.6.tar.gz/from/this/mirror
wget -O php-7.1.6.tar.gz $url
gunzip php-7.1.6.tar.gz 
tar xvf php-7.1.6

./configure \
    --enable-mbstring \
    --enable-zip \
    --enable-bcmath \
    --enable-pcntl \
    --enable-ftp \
    --enable-exif \
    --enable-calendar \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-wddx \
    --with-xpm-dir \
    --with-curl \
    --with-mcrypt \
    --with-iconv \
    --with-gmp \
    --with-pspell \
    --with-gd \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-freetype-dir \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --with-openssl \
    --with-pdo-mysql \
    --with-gettext \
    --with-zlib\
    --with-bz2 \
    --with-recode \
    --with-mysqli

    # --prefix=$HOME/php7/usr \
    # --with-config-file-path=$HOME/php7/usr/etc \
make && make install