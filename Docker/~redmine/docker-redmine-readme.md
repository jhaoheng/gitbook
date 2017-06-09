# first use : Run Redmine with SQLite3

- docker 
	- docker pull redmine
	- docker run -p 3000:3000 -d --name some-redmine redmine
- 登入
	- localhost:3000
	- 帳號 admin
	- 密碼 admin
	- 登入後會要求更改密碼
		- 請改為 12345678
- 注意
	- 此方法，不適用多個用戶，是用 sqlite3 當作 db

# run redmine with database container

1. start a database container
	- PostgreSql : `docker run -d --name some-postgres -e POSTGRES_PASSWORD={pw} -e POSTGRES_USER={user} postgres`
	- MySql : `docker run -d --name some-mysql -e MYSQL_ROOT_PASSWORD ={pw} -e MYSQL_DATABASE ={db} mysql`
2. start redmine
	- `docker run -d --name some-redmine --link some-postgres:postgres redmine`
		- 換為 mysql, replace  `some-postgres:postgres` to `some-mysql:mysql`

# docker-compose