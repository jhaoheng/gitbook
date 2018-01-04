## first

- 目的 : 在 docker 架構下，解決 mariadb container 建立後，自動加入 schema 到 db 中
- 可參考 https://stackoverflow.com/questions/36617682/docker-compose-mysql-import-sql
- 解決 : 在 mariadb 起來後，會自動去執行 `/docker-entrypoint-initdb.d/` 底下的 sql 指令，就會自動建立好預設的 database & table

## example : docker-compose

### sql file : save as test.sql
```
#
# SQL Export
# Created by Querious (1068)
# Created: 2017年9月5日 GMT+8 上午9:27:31
# Encoding: Unicode (UTF-8)
#

CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 DEFAULT COLLATE latin1_swedish_ci;
USE `test`;

SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `created_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;
```

### docker-compose.yml
```
version: '3.0'
services:
  mariadb:
    image: mariadb
    container_name: some-mariadb
    ports:
      - 3306:3306/tcp
    environment:
      - MYSQL_ROOT_PASSWORD=1234
    volumes:
      - test.sql:/docker-entrypoint-initdb.d/test.sql
```

### 驗證

1. `docker exec some-mariadb mysql -u root --password=1234 --database=test -e "show tables;"`