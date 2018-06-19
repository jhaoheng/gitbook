---
layout: post
title: "【nginx】add dynamic module to an existing nginx"
date: 2017-11-04 16:17
categories: docker nginx module
---

# 目標
1. 首先這是一個替 nginx 動態增加 module 的程序
2. 利用 docker : nginx 來建立已經安裝好 nginx 的環境
3. 因為動態安裝 module，必須要相同的 nginx 版本，與相同的設定資訊
<!--more-->
# 環境
- osx
- docker, nginx:latest 
- 安裝的 module : `https://github.com/kwojtek/nginx-rtmpt-proxy-module`

# first at all
`docker run -it -p 80:80 -p 443:443 nginx:latest /bin/bash`

# 可能會用到的套件
```
apt-get update && \
apt-get install iputils-ping -y && \
apt-get install procps -y && \
apt-get install vim -y && \
apt-get install lsof -y && \
apt-get install curl -y && \
apt-get install git -y && \
apt-get install wget -y
```

# 安裝 gcc
apt-get install build-essential -y

# 檢查 nginx, 取得

`nginx -V`

1. 版本號
2. 設定參數 : 編譯時，需要用到，否則會有二進制不相容問題, ex : configure arguments: --prefix=/etc/nginx .... 
 

# 下載 nginx : 依照版本號碼
```
wget http://nginx.org/download/nginx-{version}.tar.gz
tar xvf nginx-{version}.tar.gz
```

# 下載 module
`git clone https://github.com/kwojtek/nginx-rtmpt-proxy-module.git`

# 取得編譯時需要的 dependency
## PCRE
- `wget https://ftp.pcre.org/pub/pcre/pcre-8.40.tar.gz && tar xzvf pcre-8.40.tar.gz`
- 編譯時加上 : `--with-pcre=<path>`
## zlib
- `wget http://www.zlib.net/zlib-1.2.11.tar.gz && tar xzvf zlib-1.2.11.tar.gz`
- 編譯時加上 : `--with-zlib=<path>`

## openssl
- `wget https://www.openssl.org/source/openssl-1.1.0f.tar.gz && tar xzvf openssl-1.1.0f.tar.gz`
- 編譯時加上 : `--with-openssl=<path>`

# 開始編譯
```
./configure --add-dynamic-module=/root/nginx-rtmpt-proxy-module \
--with-openssl=/root/openssl-1.1.0f/ \
--with-pcre=/root/pcre-8.40/ \
--with-zlib=/root/zlib-1.2.11/ \
{--prefix=/etc/nginx --sbin-path=....} <---- 加入設定參數
```

ex:
```
./configure --add-dynamic-module=/root/nginx-rtmpt-proxy-module \
--with-openssl=/root/openssl-1.1.0f/ \
--with-pcre=/root/pcre-8.40/ \
--with-zlib=/root/zlib-1.2.11/ \
--prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-g -O2 -fdebug-prefix-map=/data/builder/debuild/nginx-1.13.6/debian/debuild-base/nginx-1.13.6=. -specs=/usr/share/dpkg/no-pie-compile.specs -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' --with-ld-opt='-specs=/usr/share/dpkg/no-pie-link.specs -Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie'
```

# 產生 modules
`make modules`

# 將 moduels 放到目前版本的 nginx/module 下
`cp {path}/nginx-{version}/objs/ngx_rtmpt_proxy_module.so /etc/nginx/modules`

# 更改 nginx.conf : 在最上層加入此行
> not within the http or stream context

```
load_module modules/ngx_rtmpt_proxy_module.so;
```
