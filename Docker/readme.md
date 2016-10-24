# ssh 進入 server

```
docker ps
```

選擇id
執行
```
docker exec -i -t <id> bash
```

就進入 docker 中

## port
```
docker ps
docker port id
```

## 更改 port
```
要先停止 container
到 synology 中編輯該 container 的 port(docker 對 container 的設定)
重新啟動後
synology 對 docker 的 port 要打開(主機對 docker 的設定)
```

## cp
```
docker cp foo.txt mycontainer:/foo.txt
docker cp mycontainer:/foo.txt foo.txt
```
mycontainer = CONTAINER ID 

## 執行 crontab 
注意因為版本問題，可能會產生錯誤


## 資源連結
[other book](https://philipzheng.gitbooks.io/docker_practice/content/dockerfile/basic_structure.html)

## info

### 優點
- First: It’s immutable
- Second: It’s lightweight
- Third: It’s fast

### 缺點
- Don’t store data in containers
- Don’t ship your application in two pieces
- Don’t create large images
- Don’t use a single layer image
- Don’t create images from running containers
- Don’t use only the “latest” tag
- Don’t run more than one process in a single container
- Don’t store credentials in the image. Use environment variables
- Run processes with a non-root user
- Don’t rely on IP addresses