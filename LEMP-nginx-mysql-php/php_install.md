## 安裝
`yum install php php-mysql php-fpm php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel`

## 調整 nginx/conf.d/default 設定

`vim /etc/nginx/conf.d/default.conf `

```
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/log/host.access.log  main;

	
    root    /home/nginx_root/www;
    index  index.php index.html index.htm;

    location / {
        #root   /usr/share/nginx/html;
	#root	/home/nginx_root/www;
        #index  index.html index.htm index.php;
	try_files $uri $uri/ =404;
    }

    error_page  404 /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        #root   /usr/share/nginx/html;
	root   /home/nginx_root/www;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
	try_files $uri =404;
	fastcgi_split_path_info ^(.+\.php)(/.+)$;
        #root           html;
        fastcgi_pass   127.0.0.1:9000;

	#fastcgi_pass   unix:/var/run/php-fpm/php-fpm.sock;
        fastcgi_index  index.php;
        #fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
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

## 設定 php.ini
路徑：`vim /etc/php.ini`

搜尋：`cgi.fix_pathinfo`，變更 =0


## error fixed
1. 出現 No input file specified : php設定錯誤
2. 出現 File Not Found：php 設定錯誤

## 重新啟動
```
kill -9 <pid of nginx & php>
cd bin/ ; nginx
/sbin/php-fpm &amp;
```