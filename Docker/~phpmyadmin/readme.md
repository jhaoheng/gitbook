1. 建立好 mysql docker 後，需設定建立的 --name
2. docker pull phpmyadin/phpmyadmin
3. docker run --name myadmin -d --link [name]:[alias] -p 8080:80 phpmyadmin/phpmyadin
	- alias 是 mysql 容器的別名
4. http://localhost:8080
	- 帳號 root
	- 密碼 為 建立 mariadb 時的密碼