# minikube

> 需要先開始 ingress 的服務

1. 查看服務是否開啟 : `minikube addons list`
2. 啟動服務 : `minikube addons enable ingress`
3. 確認服務 
  - `minikube addons list`
  - `minikube service list`
4. 建立 ingress 服務, 可在 <nodeIP>:<port> 中, 看到服務的曝光