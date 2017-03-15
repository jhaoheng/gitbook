yum --enablerepo=remi-php70 update
yum --enablerepo=remi-php70 install phpmyadmin


安裝後
會在 /etc/phpMyAdmin 下看到設定檔

程式主體在 /usr/share/phpMyAdmin

所以將 nginx.conf 的 server root 位置指到該位置即可