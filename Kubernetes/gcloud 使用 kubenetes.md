# gcloud 設定

1. `gcloud auth login` : 請注意該帳號需有 google cloud console : gotomything 的權限
2. `gcloud config set project gotomythings` : 設定 project
3. 地區
	- `gcloud compute zones list` : 查詢所有地區
	- `gcloud config set compute/zone {zone}`
4. `gcloud config list`

## push docker image to gcloud Container Registry

1. 檢查目前 images : `docker images`
2. 重新 tag 要上傳的 image : `docker tag {image_id} {location}/[project_id}/{image_name}`
	- 透過 `gcloud docker -a` 查詢 {location}
3. 檢查 `docker images` 會發現多一個 images
4. push : `gcloud docker push {location}/{project_id}/{image_name}`

## 從 Container Registry 刪除 image

1. 本機 : `docker rmi {image_id} {location}/{project_id}/{image_name}`
2. gcloud : 可直接到 consonle 的 registry 中，進入 image，將該版本刪除

## 從 Container Registry 到 Container clusters

0. 建立一個 cluster
	- `gcloud container clusters create {name} --zone=...`
		- Get zones list : `gcloud compute zones list`
1. `gcloud container clusters get-credentials {cluster_name}`
	- pro {cluster_name} : **gotomythings**
2. `kubectl run {name} --image={location}/{project_id}/{image_name}:{tag} --port=3000`
3. `kubectl expose --protocol=TCP --port=80 --target-port=3000 deployment {name} --type="LoadBalancer"`
4. `kubectl expose deployment {name} --type="LoadBalancer"`
5. `kubectl get service {name}` : 取得對外 ip
6. `kubectl delete service,deployment {name}`