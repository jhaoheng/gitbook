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