# kubernates

1. 了解 kubernates
2. 組成
	- kubectl : 客戶端命令行工具，將接受的命令格式化後發送給kube-apiserver，作為整個系統的操作入口。
	- kube-apiserver : 作為整個系統的控制入口，以REST API服務提供接口。
	- kube-controller-manager : 用來執行整個系統中的後台任務，包括節點狀態狀況、Pod個數、Pods和Service的關聯等。
	- kube-scheduler : 負責節點資源管理，接受來自kube-apiserver創建Pods任務，並分配到某個節點。
	- etcd : 負責節點間的服務發現和配置共享。
	- kube-proxy : 運行在每個計算節點上，負責Pod網絡代理。定時從etcd獲取到service信息來做相應的策略。
	- kubelet : 運行在每個計算節點上，作為agent，接受分配該節點的Pods任務及管理容器，周期性獲取容器狀態，反饋給kube-apiserver。
	- DNS : 一個可選的DNS服務，用於為每個Service對象創建DNS記錄，這樣所有的Pod就可以通過DNS訪問服務了。
原文網址：https://read01.com/BJ8Rze.html

# Kubernetes 與 Docker Swarm Mode 差異

- Kubernetes 的 Pods 就是 Docker Swarm 的 Service
- 對於 Rolling Update:
	- Kubernetes : 先起來新的 Pod 是新的版本，然後關閉舊的 Pod． 也就是原先有 3 個 Pod ，為了要 Rolling Update 於是產生另外 3 個新的 Pod ．等到穩定後，把舊的 3 個 Pod 關閉．
	- Docker Swarm: 透過 Load Balancer 把沒有用的先換成新的．
- 對於 Routing Mesh :
	- Kubernetes : 並沒有這個功能，因為對外需要透過 Expose
	- Docker Swarm : 每個 Node 都具有 Routing Mesh ，也就是都可以連接到 Service

# 學習

https://gcpug-tw.gitbooks.io/kuberbetes-in-action/content/kubernetes_concept.html