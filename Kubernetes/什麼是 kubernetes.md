# 總結
- kubernetes engine api : 管理部署到 gcloud 的引擎
- kubernetes api : 負責告訴 cluster 要使用並建立的 api, 格式為 yml
- kubectl : 負責管理操作部署的指令
- 所以要部署時，順序為
	1. 確定部署的平台 : minikube / aws / gcp
	2. 確定部署的 yml 文件
	3. 利用 kubectl 部署

# kubernetes engine api
> 這是 gcloud 上的 kubernetes engine 專用的 api
> 使用 Kubernetes Engine API 與 gcloud cmd line interface 來設定 cluster 在 Google Cloud Platform
> 要將容器部署在 gcloud 上，就需要用到
> 這名稱很容易搞混，但其實就是 Google Cloud Platform:gke 的管理

- 建立 gcloud 上的 cluster
- 刪除 cluster
- 設定 cluster-level networking
- 更新在 gcloud cluster 上的 kubernetes 版本
- 新增移除、修改在 cluster 上的 node pools
- 為你的 cluster 的 nodes 設定機器類型或 node 映象檔
- 配置群集運行的地理區塊或區域

# kubernetes API
> 使用 kubernetes API 與 kubectl (cmd-line interface) 來管理叢集的容器應用程式與負載
> 要將容器部署在任意平台上，就需要用到

- 部署(deploying)
- 擴充(scaling)
- 配置群集內網絡設置
- 配置 Pods 與 Containers
- 控制何時卸下或重新啟動 pods

## kubernetes API
> 這個東西是設定檔(yml) 中的 apiVersion, 目的要告訴 cluster 要建立什麼東西
> https://kubernetes.io/docs/concepts/overview/object-management-kubectl/declarative-config/
