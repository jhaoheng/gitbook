# namespace

# node
就是 minikube, 負責管理所有的運作

# deployment
> 新版用 deployment 取代 replication contriller

![img](https://tachingchen.com/img/kubernetes-rolling-update-with-deployment/deployment.png)

- 告知 replicas 要處在服務狀態的 pod 數量
- 支援滾動升級(Rolling update)
- 額外支援回滾(Roll back)的機制
- 讓 Deployment 控管多個 Replica Set 的主要原因在於支援回滾機制 (Rollback)。每當部署新的 Deployment 設定時，Kubernetes 會依據新設定重新生成一個 Replica Set 並保留舊設定，未來有需要的話就能直接利用舊的 Replica Set 回滾至先前狀態。必須注意的是同時間只會有一個 Replica Set 生效 (DESIRED > 0)。

# replica sets
- 一種副本的概念
- 一個 replica 類似一個映像檔
- 監控 pod 是否保持一定的數量
- 每個 pod 的內容都會一樣，目的在於解決 load balance

# pods
- 一個 pod 可以包含多個 containers
- 可以想像成：一個 pod 就是一個 instance

# service
- 讓 pod 對外開放的窗口