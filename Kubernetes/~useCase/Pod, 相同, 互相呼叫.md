1. 夠過 kubectl port-forward, 將 pod 中的某個 port, 與本機端的 port 做 mapping 
	- `kubectl port-forward my-pod 8000:3000`
2. 建立 service, 將 pod 對外曝光
	- kubectl port-forward 是將 pod 的 port mapping 到本機端上，而 kubectl expose 則是將 pod 的 port 與 Kubernetes Cluster 的 port number 做 mapping。 