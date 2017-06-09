1. docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD={pw} -d mariadb
	- MYSQL_ROOT_PASSWORD 為建立 container 時，設定 root 的 密碼
2. 登入時的帳密
	- root
	- {pw}
3. 官網有各類的環境參數 : https://hub.docker.com/_/mariadb/