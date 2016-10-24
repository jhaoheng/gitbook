# redis

## install 

- brew install redis
- brew info redis

> To have launchd start redis now and restart at login:
  brew services start redis
Or, if you don't want/need a background service you can just run:
  redis-server /usr/local/etc/redis.conf
  
- 安裝後，到 /usr/local/Cellar/redis/.../bin/ 中可看到所有指令

- 設定檔位於 : /usr/local/etc
	- redis-sentinel.conf
	- redis.conf

## how to use

http://www.runoob.com/redis/redis-install.html

http://redis.io

http://try.redis.io/

### redis 配置

Redis 的配置文件在安裝目錄下