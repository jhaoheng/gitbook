## set

sudo yum -y install epel-release

sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

sudo yum -y update

sudo yum -y install nginx php70-php-fpm

## nginx
直接啟動服務，並讓它在開機後自動啟動
sudo systemctl restart nginx
sudo systemctl enable nginx 


sudo vi /etc/nginx/conf.d/default.conf
```
server {
    listen       80;
    server_name  localhost;

    charset utf-8;
    access_log  /var/log/nginx/access.log  main;

    root   /usr/share/nginx/html;
    index  index.php index.html index.htm; 

    location / {
        try_files $uri $uri/ =404;
    }

    error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
```

SELinux 會限制 Nginx 寫入動作，所以還要打開主目錄的存取權限
sudo chcon -R -t httpd_sys_rw_content_t /usr/share/nginx/html

sudo systemctl reload nginx


## php.ini
sudo vi /etc/opt/remi/php70/php.ini
```
cgi.fix_pathinfo=0
```

## php-fpm
sudo vi /etc/opt/remi/php70/php-fpm.d/www.conf
```
user = nginx
group = nginx
listen.owner = nobody
listen.group = nobody
```

## restart php-fpm
啟動 PHP-FPM，並讓它在開機後自動啟動
sudo systemctl restart php70-php-fpm
sudo systemctl enable php70-php-fpm

## test

<?php phpinfo(); ?>