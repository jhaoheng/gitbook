# LEMP 

## 環境
- docker : Docker version 1.6.2, build a263667
- centOs : Linux centos7-2-1511 3.10.35 #5644 SMP Fri Jan 22 13:38:47 CST 2016 x86_64 x86_64 x86_64 GNU/Linux

## ngnix

1. 安裝套件 : `rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm`
2. 安裝 : `yum install nginx`
3. 執行 : `cd /bin ; nginx`
4. 確認 : `ps aux | grep nginx`
5. 根目錄 : `/usr/share/nginx/html`

### cent67 出現 error
```
Error: Package: 1:nginx-1.8.1-1.el7.ngx.x86_64 (nginx)
           Requires: libpcre.so.1()(64bit)
Error: Package: 1:nginx-1.8.1-1.el7.ngx.x86_64 (nginx)
           Requires: libc.so.6(GLIBC_2.14)(64bit)
Error: Package: 1:nginx-1.8.1-1.el7.ngx.x86_64 (nginx)
           Requires: systemd
```

## 查看基本設定

```
cd /etc/nginx/conf.d
vim default.conf
```

## 更改預設路徑
`/usr/share/nginx/html` -> `/home/nginx_root/www/`

```
vim /etc/nginx/conf.d/default.conf
```
改為下方

```
location / {  
        #root   /usr/share/nginx/html;  
        root    /home/nginx_root/www;  
        index  index.html index.htm index.php;
    }
```

## 參數調整

### nginx.conf

`vim /etc/nginx/nginx.conf`

```
user  nginx;//啟動 nginx 程序的使用者
worker_processes  1;//開啟程序的數量，對應cpu n核，進行調整，多設無用

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;// ProcessID 存放位置


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

### conf.d/default.conf

`vim /etc/nginx/conf.d/default.conf`

```
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/log/host.access.log  main;

    location / {
        #root   /usr/share/nginx/html;
		 root	/home/nginx_root/www;
        index  index.html index.htm index.php;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
        root           html;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        include        fastcgi_params;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
```