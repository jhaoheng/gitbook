# 建立基本的 docker registry


## 測試 registry

1. curl -X GET localhost:5000/v2/
2. 相關的 rest api : https://docs.docker.com/registry/spec/api/#detail

## 加入 dns

## images 放到 aws s3

## login to registry
- docker login localhost:5000
	- 帳密隨便打也會進入

## registry 設定檔

# q

1. push 到 registry 時，預設存放的位置，/var/lib/registry
	- 可透過 docker exec 進去 container 中查看
2. 如何 ping
3. 使用的版本，目前有分 v1 v2 api 都不相同