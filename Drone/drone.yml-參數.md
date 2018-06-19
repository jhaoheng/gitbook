

# workspace 
- base
- path

```
workspace:
  base: /go
+ path: src/github.com/octocat/hello-world
```
=> `git clone https://github.com/octocat/hello-world /go/src/github.com/octocat/hello-world`

# clone
- git # 若無任何認定，drone 會自動預設克隆的步驟
	- image : 
	- depth : 克隆的 tree 的深度
	- path  : 可個別指定版本控管的位置與基本路徑

# pipeline # 所有的 建立步驟、測試、發布，都透過此區域設定，執行的方式是依序執行

```
pipeline:
  backend:
    image: golang
    commands:
      - go build
      - go test
  frontend:
    image: node
    commands:
      - npm install
      - npm run test
      - npm run build
```

- 以上的指令如 : `docker run --entrypoint=build.sh golang`，build.sh 中的指令就是 commadns


> 所有的指令，透過 commands 來進行，請勿在這邊安裝任何 plugins or services。
 
- commands 可直接指定 script file，但如此一來 log 就只會顯示執行 command.sh 的資訊，剩下的都是內容回覆，不會有依序執行單一指令的 log

```
   commands: 
    - chmod +x /srv/drone-demo/example/command.sh
    - /srv/drone-demo/example/command.sh
```

- command.sh file

```
#!/bin/sh

set -e

pwd
ls
```

## 並行執行
> 之前有提到，在 drone.yml 中的設定，是依序執行，但也可以在 pipeline 中，進行並列執行，設定 group 即可

> 此範例  backend & frontend 會並列執行，pipeline 會在兩者都完成後，才會執行 publish 的動作

```
pipeline:
  backend:
+   group: build
    image: golang
    commands:
      - go build
      - go test
  frontend:
+   group: build
    image: node
    commands:
      - npm install
      - npm run test
      - npm run build
  publish:
    image: plugins/docker
    repo: octocat/hello-world
```
# Conditional Pipeline Execution

> 透過 branches : include & exclude 來限制要執行的 branch

```
pipeline:
	build:
		image: golang
		commands:
			- go build
			- go test
branches: 
	include: [master, develop]
	exclude: [...]
```

> 除了透過 .drone.yml 的設定外，告訴 drone 忽略編譯，也可以透過 git commit -m "....  [CI SKIP]" 來忽略這一次的編譯

# Conditional Step Execution

## branch

> 以下的指令是，限制 slack 的執行緒，只有當 branch 在 master 時，且無論成功或失敗，才會被執行

```
pipeline:
  slack:
    image: plugins/slack
    channel: dev
+   when:
+     branch: [master, dev]
+     status: [ success, failure ]
```
> 也可使用 include & exclude 來限制

## 事件
> 當某個事件發生時，執行。在這個範例中，使用 github tag 的發生，當作一個事件，若要開啟 tag 監測，請開啟 drone setting 的設定

```
when:
  event: tag
+ branch: master
```

> 所有的建立事件
```
when:
  event: [push, pull_request, tag, deployment]
```

## 狀態 status

> 當狀態變更時
```
when:
  status: changed
```

> 當成功或者失敗時
```
when:
  status:  [ failure, success ]
```

## platform
> 在特定平台上才執行。ex : 針對特定平台的測試 or 發布通知

```
when:
  platform: linux/amd64
```

> 使用 wildcards 進行平台的指定

```
when:
  platform:  [ linux/*, windows/amd64 ]
```

## Environment

> 未知使用方式

```
when:
  environment: production
  event: deployment
```

## Matrix

> 未知使用方式

```
when:
  matrix:
    GO_VERSION: 1.5
    REDIS_VERSION: 2.8
```

## Instance
> 未知使用方式

# example
## ex1
```
workspace: 
  base: /srv/drone-demo 	# 設定，drone 會把 git-repo 克隆一份到自己系統中，設定的這個目錄下
  path: . 					# 預設路徑

pipeline: 					# 設定，建構所需的 Docker image、環境變量、指令
  build: 					# 自訂的名稱
	 image: golang:alpine 	# 建立的 docker image，也就是說會在 drone 中，執行這份 code 的基本環境
	 pull: true 			# 執行時，總是取得最新的版本
	 environment:
	   - KEY=VALUE
	 secrets: [key1, key2]
	 commands: 				# 執行的指令
	   - echo $$KEY
	   - pwd
	   - ls
	   - CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app . # 建立不同的 binary
	   - ./app
```


# ex2
```
pipeline:
  	# 後端測試
  	backend: 
    	image: golang
    	commands:
      		- go get
      		- go build
      		- go test
  	# 前端測試
  	frontend:
    	image: node:6
    	commands:
      		- npm install
      		- npm test
  	# 上傳到設定的 docker registry
  	publish:
    	image: plugins/docker
    	repo: octocat/hello-world
    	tags: [ 1, 1.1, latest ]
    	registry: index.docker.io
  	# 通知訊息
  	notify:
    	image: plugins/slack
    	channel: developers
    	username: drone
	services:
		elasticsearch: 		# 服務名稱
			image: docker.elastic.co/elasticsearch
		redis:
			image: redis:latest
		postgres:
			image: postgres:9.5.5
			environment:	# 全域變數
				- POSTGRES_DB=dbname
				- POSTGRES_USER=user
				- POSTGRES_PASSWORD=password
```

## ex3
```
pipeline:
  frontend:
    image: node
    commands:
      - npm install
      - npm test
  backend:
    image: golang
    commands:
      - go test -v
      - go install

services:
  database:
    image: mysql
```

## ex4 : 平行測試
```
pipeline:
	frontend:
		image: node:8.1.2
		group: testing # 平行測試
		commands:
			- yarn install
			- yarn run production
	backend:
		image: laradock/workspace:1.8-71
		group: testing # 平行測試
		commands:
			- php artisan key:generate
			- php artisan migrate
			- ./vendor/bin/pupunit
```

## ex5 : 額外的服務
```
services:
	elasticsearch: 		# 服務名稱
		image: docker.elastic.co/elasticsearch
	redis:
		image: redis:latest
	postgres:
		image: postgres:9.5.5
		environment:	# 全域變數
			- POSTGRES_DB=dbname
			- POSTGRES_USER=user
			- POSTGRES_PASSWORD=password
```