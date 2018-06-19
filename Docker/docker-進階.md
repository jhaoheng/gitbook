## 目標

1. 下載 image
2. 建立 container
3. 

# docker

docker-engine 可以從 yum 下載，也可以直接下載 binary 然後安裝

一個完整的生命週期是 : 
pull image -> run image & create container -> kill c_id -> rm c_id -> rmi image
(c_id = container_id)

## basic cmd

- 版本 : `docker version` : check that you have the latest release installed
- 進入 container 的 bash : 
	- `docker exec -it [container_id] /bin/sh`
	- `docker exec -it [container_id] /bin/bash`

- `docker run hello-world` : 測試檔案，會出現簡易的說明
	- `docker run -d -p 80:80 --name webserver nginx`
	- `docker kill [image id]`
	- `docker images` & `docker run -d -p 80:80 nginx`

## docker registry

倉庫註冊器，並不等於 hub(倉庫)
倉庫註冊器可以有很多個倉庫
	- docker hub
	- docker pool
	- 也可在本地創在一個私有倉庫
	- 可用 push / pull 將鏡像推上倉庫
每個倉庫又可以存放多個 image(鏡像)
每個鏡像又可以存放多個 tag (也可稱作 label) 標籤

## docker hub

- 存放 docker image 的地方
- `docker login`
- `docker logout`
- `docker search {{repoName}}`
- `docker images` : 顯示出目前下載的 images


## docker image

docker 運行前(run)，會檢查本地存在的鏡像，若不存在，則會從鏡像倉庫下載，預設是 docker hub

- 下載鏡像 : `docker pull [repo-name]:[tag]`
	- 用來從倉庫獲取鏡像
	- ex : `docker pull ubuntu:12.04` = `docker pull registry.hub.docker.com/ubuntu:12.04`
		- 從 註冊服務器中 下載
	- 如果不指定具體的標記，則預設使用 latest 標記信息。
- 上傳鏡像 : `docker push [repo]`
- 移除掉 image : `docker rmi {{file}}`
- 查看本地端存放的 images : `docker images`
	- 信息欄位
		- RESPOSITORY
		- TAG
		- IMAGE ID
		- CREATED
		- VIRTUAL SIZE
	- 其中鏡像的 ID 唯一標識了鏡像，注意到 具有相同的鏡像 ID，說明它們實際上是同一鏡像。
- 建立 image : commit, push
	1. 選擇 ubuntu or centos image 並且下載
	2. 啟動 image ->  (use run)
	3. bash 進入該 container
	4. 添加功能，退出 container(exit)
	5. 遞交更新的版本
		- `docker commit -m '[message]' -a 'your_name' [CONTAINER_id] [repo:tag]`

- 變更 image 的標籤 : `docker tag --help`, ex: `docker tag [IMAGE ID] [repo]:[newTag]`

### 透過 Dockerfile 建立 image

- 基本語法
	- 使用 `#` 來註解
	- `FROM [image]:[tag]` : 鏡像基礎, ex: `FROM ubuntu:14.04`
	- `MAINTAINER Docker [name] [<email>]` : image 作者信息, ex: `MAINTAINER Docker MAX max@gmail.com` 
	- `RUN [cmd]` : 執行指令, ex: `apt-get install apache`
	- `ADD [folder_name] [folder_path]` : 複製本地文件到鏡像, ex: `ADD myApp /var/www`
	- `EXPOSE [port]` : 設定對外連接阜, ex: `EXPOSE 80`
	- `CMD .....` : 用 CMD 命令來描述容器啟動後運行的程序, ex: `CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]`
	- [其他可使用的 label]()

- 移除多餘檔案 : 透過 wget，會將 file 存放到 image 中
	- ex: 注意不能跑兩次 RUN
	
		```
		RUN wget http://xxxx.xxxx/xxx.data &&\
			rm xxx.data
		```
- 建立鏡像 : `docker build .`
	- `docker build -t="[repo]:[tag]" .`
		- `-t` : 添加 tag
		- ` .` : Dockerfile 所在路徑
- 啟動容器 `docker run .....`

### 匯出/匯入 image.tar

透過指令，[匯出]將鏡像檔變成 file 格式的封包，或[匯入]將封包輸入 docker 的 image 進行儲存
這將導入鏡像以及其相關的元數據信息（包括標籤等）

- 匯出 :
	- `docker images` 
	- `docker save -o [name].tar [repo]:[tag]`
- 匯入 : `docker load --input [name].tar` or `docker load < [name].tar`

## container

- `$ sudo docker run -p [([<host_interface>:[host_port]])|(<host_port>):]<container_port>[/udp] <image> <cmd>`
	- ex : `docker run -p 127.0.0.1:80:8080 <image> <cmd>` 

- 啟動 : 分為 "從 image 建立", "將停止狀態的 container 重新啟動"
	- 從 image 建立
		- `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`
			- `docker run ubuntu:14.04 /bin/echo 'Hello world'`
			- `docker run -it -p 8000:8000 ubuntu /bin/sh`
			- `docker run -t -i ubuntu:14.04 /bin/bash` : 建立並進入 bash
			- 在背景執行 [OPTIONS] = `-d`
		- 檢查本地是否存在指定的鏡像，不存在就從公有倉庫下載
		- 利用鏡像創建並啟動一個容器
		- 分配一個文件系統，並在只讀的鏡像層外面掛載一層可讀寫層
		- 從宿主主機配置的網橋接口中橋接一個虛擬接口到容器中去
		- 配置一個 ip 地址給容器
		- 執行用戶指定的應用程序
		- 執行完畢後容器被終止
	- 重新啟動停止的容器
		- `docker start [OPTIONS] CONTAINER [CONTAINER...]`
- 停止 : `docker stop [OPTIONS] CONTAINER [CONTAINER...]`
- 重新啟動 : `docker restart [OPTIONS] CONTAINER [CONTAINER...]`
	- 透過 `docker ps -a` 可查看終止狀態的容器

- 移除，要先 kill 再 rm
	- `docker kill [CONTAINER ID ]` : 移除掉某個 docker container
		- Kill one or more running container
	- `docker rm {{file}}` : 刪除掉 container
		- Remove one or more containers
- 查看 containers 資訊
	- `docker ps` : shows only currently running containers
	- `docker ps -a` : show all containers on the system，顯示曾經跑過的 container
- 查看 container log : `docker logs [OPTIONS] CONTAINER`

### 進入 container

1. attach : `docker attach [CONTAINER]`，但多個視窗，同時使用 attach 會讓所有窗口同步顯示相同內容。
2. exec -it : `docker exec --it [CONTAINER] /bin/sh` 
3. run -it : `docker run -it [IMAGE] /bin/sh`

### 匯出和匯入 container

如果要匯出本地某個容器，可以使用 docker export 命令
- 匯出 : `docker export [container_id] > [export_name].tar`
- 匯入 : `cat [import_name].tar | docker import - [repo]:[tag]`

# delete

- 移除掉 images
	- 一個 : `docker rmi [image_id]`
	- 全部 : `docker rmi $(docker images -q)`
	- 清理所有沒有標籤的本地鏡像 : `docker rmi $(docker images -q -f "dangling=true")`
- 移除掉 container
	- 一個 : `docker rm [container_id]`
	- 全部 : `docker rm $(docker ps -a -q)`

# 比較 docker import & load

- `docker load` : 匯入**映像檔儲存檔案**到本地映像檔庫
- `docker import` : 匯入一個**容器快照**到本地映像檔庫
- 兩者區別，`docker import` 將丟棄所有的歷史記錄和原始資料訊息（即僅保存容器當時的快照狀態）
- **映像檔儲存檔案**將保存完整記錄，檔案體積也跟著變大。此外，從**容器快照檔案**匯入時可以重新指定標籤等原始資料訊息。


# 與 container 互相拷貝檔案

docker cp [檔案位置] [container_id]:[檔案位置]

# php -S

docker run -it -p 80:80 {container_id}
此時對 container 而言 ip = 0.0.0.0 分享的 port = 80
所以執行 php -S 0.0.0.0:80

# 上傳鏡像到 docker hub

1. 先在 docker hub 上建立 repo
2. `docker login`
3. 確定 image 的 name 為 {你的帳號名稱}/{repo_name}
4. `docker push jhaoheng/{repo_name}`

# 下載 docker hub

1. docker login
2. docker pull {jhaoheng}/{repo_name}:{tag}

# troubleshoot

- image is referenced in one or more repositories : `docker rmi {name}:{tag}` 

# Dockerfile exp


- 當 Dockerfile 有新的內容時，會在現有的 image 上，新增一個 image
	- 此時在 `docker build .` 時，沒有給予 tag 則會產生 <none> : `docker build -t jhaoheng/test2:v0.2 .`
