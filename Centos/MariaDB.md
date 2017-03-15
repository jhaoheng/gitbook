# env

centos7

# flow

1. yum install mariadb-server mariadb
2. 執行 : systemctl start mariadb.service
3. 開機自動執行 : systemctl enable mariadb.service
4. 更新預設密碼
	1. mysql -u root
	2. use mysql;
	3. update user set password=PASSWORD("new_password") where User='root';
	4. flush privileges;
	5. quit

# 注意 : 因安全性問題，root 無法直接連接 db

故在 mysql 中新增 user，就可以進行登入