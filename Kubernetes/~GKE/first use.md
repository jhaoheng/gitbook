# pre
1. 建立專案
2. 啟用 kubernete api

# 部署到 GKE

## 安裝 gcloud
1. 下載 gcloud : https://cloud.google.com/sdk/downloads?hl=zh-tw
	- ./install.sh
3. 透過 gcloud 安裝 kubectl : `gcloud components install kubectl`

## 建立 project 設定 gcloud env
- gcloud init
	- 地區查詢 : https://cloud.google.com/compute/docs/regions-zones/
- gcloud auth list
- gcloud config list
- gcloud info

## 建立 image 推送到 gcloud registry
1. 檢查目前 images : `docker images`
2. 對要上傳的 image 設定 tag : `docker tag [image_id] [hostname]/[project_id]/[image_name]:[tag]`
	- hostname : `gcloud docker --help`
3. docker 獲得 gcloud 授權 : `gcloud docker --authorize-only`
4. push : `gcloud docker push [hostname]/[project_id]/[image_name]:[tag]`
5. pull : `gcloud docker pull [hostname]/[project_id]/[image_name]:[tag]`
6. list : 
	- `gcloud container images list`
	- `gcloud container images list-tags [image_name]`
7. 刪除 image : `gcloud container images delete [hostname]/[project_id]/[image_name]:[tag]`

## 建立 GKE : clusters 部署
1. 建立 : 
	- `gcloud container clusters create {GKE-name} --zone=`
		- `gcloud compute zones list`
	- 查詢
		- kubernetes cluster[kubernetes engine] : `gcloud container clusters list`
		- compute engine group : `gcloud compute instance-groups list`
		- compute engine template : `gcloud compute instance-templates list`
		- compute engine instance : `gcloud compute instances list`
2. 試著刪除掉一個 instance : `gcloud compute instances delete {instance-name}` 
	- 會再建立回來
	- 查詢時間 : `gcloud compute instances describe {name} | grep Timestamp`
3. gcloud 取得 cluster 憑證 : `gcloud container clusters get-credentials {CLUSTER_NAME}`
		
## deploy 到 cluster
1. deploy image to cluster 
	- Creating the Deployment : (建立 deployment)
		- `kubectl run {Deployment-name} --image={location}/{project_id}/{image_name}:{tag} --port={port}`
			- ex : `kubectl run hello-server --image gcr.io/google-samples/hello-app:1.0 --port 8080`
		- `kubectl get deployments`
	- Exposing the Deployment : (建立 service)
		- `kubectl expose deployment {Deployment-name} --type="LoadBalancer"`
			- 可指定 對接的 port : `--port=80 --target-port=3000`
			- ex: `kubectl expose deployment hello-server --type "LoadBalancer"`
		- `kubectl get services`
	- 取得對外 ip : `kubectl get service {name}`
	- 查看 : `kubectl get --help`
2. delete service & deployment : 
	- `kubectl delete service,deployment {Deployment-name}`
