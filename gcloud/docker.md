## basic
1. 先 login gcloud
2. 安裝 docker

## push to registry

1. 檢查目前 images : `docker images`
2. 對要上傳的 image 設定 tag : `docker tag [image_id] [location]/[project_id]/[image_name]`
	- `[location]` : ['gcr.io', 'us.gcr.io', 'eu.gcr.io', 'asia.gcr.io', 'b.gcr.io', 'bucket.gcr.io', 'appengine.gcr.io', 'gcr.kubernetes.io']
3. 檢查 `docker images` 會發現多了一個 images
4. push : `gcloud docker push [location]/[project_id]/[image_name]`

## 移除掉 [image_id] [location]/[project_id]/[image_name]

1. 本機 : `docker rmi [image_id] [location]/[project_id]/[image_name]`
2. gcloud : 可直接到 consonle 的 registry 中，進入 image，將該版本刪除

## pull

1. 登入 console
2. 進入 registry
3. 選擇 images，取得 pull 指令