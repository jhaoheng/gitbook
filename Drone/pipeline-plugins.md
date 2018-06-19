# plugins

## scp plugin

> https://github.com/appleboy/drone-scp

```
scp_dev:
	image: appleboy/drone-scp
	pull:true
	host:
	port:
	username:
	secrets: # deploy key
		- source: ssh_key
		  target: scp_key
	target: ... # 遠端目錄
	source:
		- app.tar.gz 
	when:
		branch: develop
		status: [ success ]
```

## scp ssh

> https://github.com/appleboydrone-ssh

```
ssh_dev:
	image: appleboy/drone-ssh
	pull: true
	host: # 支援平行部署
		- 192.168.1.131
		- 192.168.1.132
		- 192.168.1.133
		- 192.168.1.134
	port: ...
	username: ...
	secrets: [ ssh_key ]
	script:
		- rm -rf ${DRONE_REPO} && mkdir -p ${DRONE_REPO}
		- tar -zxmf /home/spock/drone/${DRONE_REPO}/app.tar.gz -C ${DRONE_REPO}
		- rm -rf /var/www/html/app
		- cp -r ${DRONE_REPO}/app /var/www/html/
	when:
		branch: develop
		status: [ success ]
```

## 自訂 plgins

可用 Shell Script/ nodejs/ javascript/ PHP/ Ruby/ Go/ Python/ C++ 寫 Drone Plugin

為何要寫 plugin -> 擴充 Yaml 參數

plugin 攥寫四大步驟
1. 攥寫 script
2. 打包成 docker image
3. 上傳到 docker hub
4. 測試

```
pipeline:
	webhook:
		image: foo/webhook
		url: ...		# 自訂參數
		method: ...		# 自訂參數
		body: ...		# 自訂參數
```

1. script
```
curl -X ${PLUGIN_METHOD} -d ${PLUGIN_BODY} ${PLUGIN_URL}
```

2. 包成 docker image
```
FROM			alpine
ADD				script.sh /bin/
RUN				chmod +x /bin/script.sh
RUN 			apk -Uuv add curl ca-certificates
ENTRYPOINT		/bin/script.sh
```
3. 上傳到 docker hub / docker registry
```
docker build -t foo/webhook .
docker push foo/webhook
```

4. 測試
```
docker run --rm -e PLUGIN_METHOD=... -e PLUGIN_URL=... -e PLUGIN_BODY=... foo/webhook
```