# insatll env

1. 建立 gcloud project，在 google console 建立
	- 新帳號，可以有 free time
2. 安裝 gcloud : <https://cloud.google.com/sdk/docs/quickstart-mac-os-x>
3. 透過 gcloud 安裝 kebectl : `gcloud components install kubectl`
4. git clone `gotomything` repo

# 設定 cmd : gcloud

## easy 

1. 請至 Container Engine
2. 建立一個新的 cluster
3. 點選 cluster 右方的 connect，即將本機環境連接到該 cluster
4. 開啟 cmd 確定 config，`gcloud config list`

## cmd

1. `gcloud auth login`
	- 檢查 : `gcloud auth list`，有 activated 的帳號
2. 設定 project : `gcloud config set project [project_id]` 
	- [project_id] : "gotomythings"
3. 查詢 所有的 zone : `gcloud compute zones list`
4. 設定目前的 zone : `gcloud config set compute/zone [zone]`
5. 建立 cluster : `gcloud container clusters create [cluster_name]`
6. 查詢 config : `gcloud config list`

## config reference

```
[compute]
zone = asia-east1-c
[core]
account = max.hu@orbweb.com
disable_usage_reporting = True
project = gotomythings
```

# 建立 disk 給 mongo mount

- 建立 : `gcloud compute disks create --size=[xx]GB --zone=[zone] [disk_name]`
	- [disk_name] : 請配合 repo 中 pv.yaml 中的 pdName，須相同
		- 原理 : 透過 kubectl 指令，設定 pv.yaml 將 pv 掛載到該 disk 上
		- info : <http://kubernetes.io/docs/user-guide/volumes/>
- 查看所有的 disk : `gcloud compute disks list`
- 刪除 disk : `gcloud compute disks delete [disk_name]`

# 使用 kubectl

1. 確定好 gcloud config 後
2. 顯示出目前所有的 cluster : `gcloud container cluster list`
3. 取得 cluster credentials : `gcloud container clusters get-credentials [cluster-name]`
	- **透過 easy 的 connect 一樣也會取得 credentials**
4. 移動到 repo 資料夾 : `cd gotomythings/k8s` 
5. 建立 kubernetes pod / service / deployment
	- `kubectl create -f persistence/mongo -R`
	- `kubectl create -f persistence/redis -R`
	- `kubectl create -f services/gcs-proxy -R`
	- `kubectl create -f services/hello-world -R`
	- `kubectl create -f services/cvr-api -R`
	- `kubectl create -f services/cvr-ingestion -R`
		- 與 mongo 整合寫入
	- `kubectl create -f addons/newrelic -R`
		- 監控
	- `kubectl create -f http-loadbalancer.yaml`
		- 對外的接口設定，請參考 [使用 loadbalance.yaml]
		- 須等待 十分鐘 設定完成

# 使用 loadbalance.yaml

- 可至 GCP -> Compute -> Networking 查看設定
	- Load balancing
	- Cloud DNS
- 總共會啟用 三個 backend services
	- [xx].gotomythings.com
	- assets.[xx].gotomythings.com
	- things.[xx].gotomythings.com

## 參數

- kind : Ingress
- metadata
	- name : 在 loadbalance 中顯示的名稱