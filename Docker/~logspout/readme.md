# logspout_readme

## 測試

### 建立 logspout 的 container
```
docker run --name="logspout" \
-d \-e SYSLOG_HOSTNAME={logspout_dashboard 中顯示的名稱} \--volume=/var/run/docker.sock:/var/run/docker.sock \gliderlabs/logspout \syslog+tls://logs3.papertrailapp.com:46888
```

#### 啟動 logspout 不指定 syslog+tls 的位置，透過 curl 讀取

可透過 127.0.0.1:8000:80 的方式，設定本地端街口
```
$ docker run -d --name="logspout" \
	--volume=/var/run/docker.sock:/var/run/docker.sock \
	--publish=127.0.0.1:8000:80 \
	gliderlabs/logspout
```

再透過 curl 進行 http strem 的 read
```
$ curl http://127.0.0.1:8000/logs
```


### 建立 傳送 log 的 container

- 以下兩種方法可以在 papertrial 的 log 中看到
	1. docker run -p 80:80 centos /bin/echo hello => 在 papertrial 印出 hello
	2. docker run -p 81:81 centos /bin/date => 在 papertrial 印出 日期
	2. docker run -i -d -p 80:80 centos /bin/bash
		- docker exec -it [container_id] /bin/bash
			- echo hello >> /proc/1/fd/1 => 在 papertrial 印出 hello
- 注意 : docker run 用 -t 啟用的話，就不會被 logspout 給監聽到
- 注意 : logging driver 只支援 `journald`, `json-file`

## compose
透過 composer 直接建立

```
version: "3.0"services:  web:    image: renizgo/c7-systemd-httpd    volumes:      - /sys/fs/cgroup:/sys/fs/cgroup:ro    privileged: true    ports:      - 80    labels:      io.rancher.container.pull_image: always  logspout:    container_name: logspout    image: gliderlabs/logspout:master    command: syslog+tls://logs3.papertrailapp.com:46888    environment:      - SYSLOG_HOSTNAME=max    volumes:      - /var/run/docker.sock:/tmp/docker.sock    restart: always
```