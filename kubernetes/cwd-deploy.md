http://kubernetes.io/docs/hellonode/

# basic
1. 建立 gcloud project
2. 安裝 gcloud : <https://cloud.google.com/sdk/docs/quickstart-mac-os-x>
3. 透過 gcloud 安裝 kebectl : `gcloud components install kubectl`

# 建立測試檔案

1. 建立 Dockerfile

	```
	var http = require('http');
	var handleRequest = function(request, response) {
	  console.log('Received request for URL: ' + request.url);
	  response.writeHead(200);
	  response.end('Hello World!');
	};
	var www = http.createServer(handleRequest);
	www.listen(8080);
	```
2. 透過 docker build -t 進行 project 的 docker 封裝
	- `docker build -t gcr.io/$PROJECT_ID/hello-node:v1 .`
3. 測試 docker run : `docker run -d -p 8080:8080 --name hello_tutorial gcr.io/$PROJECT_ID/hello-node:v1`
4. 檢查 docker ps
5. 停止 docker stop

# 上傳 image 到 gcloud

1. 透過 gcloud 上傳 : `gcloud docker push gcr.io/$PROJECT_ID/hello-node:v1`
	- 上傳前須先確認 glcoud 已經 login
		- `gcloud auth login`
	- 換成其他帳號
		- `gcloud config set account ACCOUNT`
	- 上傳的位置，會放在 Compute > Container Engine > Container Registry
2. 檢查目前啟用帳號
	- `gcloud auth list`

# 建立 cluster

1. 設定 Google Cloud Project zone : `gcloud config set compute/zone us-central1-a`
2. 設定 cmd project id : `gcloud config set project [project_id]`
3. 查看目前設定 : `gcloud config list`
3. create cluster : `gcloud container clusters create [cluster_name]`
	- 備註：當建立好 cluster 後，computer 會自動建立相關的 instance
4. 取得 credential 給 kubectl 使用 : `gcloud container clusters get-credentials [cluster_name]`
	- 應該是在這邊取得 hello-world cluster 的 credentials 然後接下來的 kubectl 直接使用

# kubernetes 

- Create kubernetes pod
	1. Create a Pod : `kubectl run hello-node --image=gcr.io/$PROJECT_ID/hello-node:v1 --port=8080`
		- 將 hello-node 放入 hello-world cluster
		- $PROJECT_ID 若無設定，則會發生 ErrImagePull
		- 尚未開啟對外連線，所以還是無法連入網頁
		- 這邊會放入一個 docker 到 credentials 的叢集中
		- 若再 run [new_name] --image 會產生另一個 pod 在該 cluster 中
	2. view the Deployment : `kubectl get deployments`
	3. view the Pod created by the deployment : `kubectl get pods`
	4. view the stdout / stderr from a Pod : `kubectl logs <POD-NAME>`
	5. view metadata about the cluster : `kubectl cluster-info`
	6. view cluster events : `kubectl get events`
	7. view the kubectl configuration : `kubectl config view`
	8. more info : <http://kubernetes.io/docs/user-guide/kubectl-overview/>
- Allow external traffic : 讓外部可以連入 cluster，以上設定只有內部可連接
	1. 設定 專案的類型為 LoadBalancer : `kubectl expose deployment hello-node --type="LoadBalancer"`
	2. find the ip addresses associated with the service : `kubectl get services hello-node`
		- 若沒看到 EXTERNAL-IP，請等系統建置完成
	3. 檢查 log : `kubectl logs <POD-NAME>`
- Scale up your website
	1. 設定要 auto scale 的數量 : `kubectl scale deployment hello-node --replicas=4`
		- 若刪除掉 compute engine 則會自動建立回來，可用 以下 觀察
			- `kubectl get pods`
			- `kubectl get deployment`
- Roll out an upgrade to your website
	1. `docker build -t gcr.io/$PROJECT_ID/hello-node:v2 .`
	2. `cloud docker push gcr.io/$PROJECT_ID/hello-node:v2`
	3. `kubectl set image deployment/hello-node hello-node=gcr.io/$PROJECT_ID/hello-node:v2`
	4. `kubectl get deployments`
- 查看在該 cluster 下，到底加入了哪些 pods 與 docker Containers image
	- 可直接登入 kubernetes console 中
	- 使用 cmd :
		- 查詢所有的 pods : `kubectl describe pods`
		- 查詢指定的 pod
			1. 列出 pod name : `kubectl get pods`
			2. `kubectl describe pod/[name]`

# Cleaning it Up
- 刪除 kubectl 建立的服務 : `kubectl delete service,deployment hello-node`
- 刪除 cluster : `gcloud container clusters delete hello-world`
- 刪除 docker registry : 
	- `gsutil ls`
	- `gsutil rm -r gs://artifacts.$PROJECT_ID.appspot.com/`

# 其他
- 查詢所有的 zones : `gcloud compute zones list` 

# 問題解決

> 執行 : `kubectl run hello-node --image=gcr.io/$PROJECT_ID/hello-node:v1 --port=8080`
> 出現 : error: failed to negotiate an api version; server supports: map[], client supports: map[apps/v1alpha1:{} batch/v2alpha1:{} authentication.k8s.io/v1beta1:{} federation/v1beta1:{} v1:{} policy/v1alpha1:{} authorization.k8s.io/v1beta1:{} batch/v1:{} rbac.authorization.k8s.io/v1alpha1:{} autoscaling/v1:{} componentconfig/v1alpha1:{} extensions/v1beta1:{}]
> 
> 解決 : gcloud components install kubectl
> gcloud config set compute/zone us-central1-a
> gcloud container clusters create hello-world
> gcloud container clusters get-credentials hello-world
> 然後就成功了，我想應該是某個空白鍵的問題
> 結果是 auth login 的關係

## 掛載 volume
- 掛載 mongo 時，須先建立 disk 空間 : http://kubernetes.io/docs/user-guide/volumes/
	- gcloud compute disks create --size=500GB --zone=us-central1-a my-data-disk
	- 才可成功掛載 Volume 
- 查看所有的 disk : `gcloud compute disks list`

## loadbalance

- 查詢掛載的 ingress : kubectl get ing

# 名詞介紹

- pod : 在 kubernetes 中，負責匯聚眾多 containers，叫做 pod，透過 kubectl run 可以將 image 放在同一個 pod 中。
	- http://kubernetes.io/docs/user-guide/pods/
- deployment
- services