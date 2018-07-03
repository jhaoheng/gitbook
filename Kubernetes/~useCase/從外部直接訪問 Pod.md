# 從外部訪問 pod

- hostNetwork
- hostPort
- NodePort
- LoadBalancer
- Ingress

## hostNetwork
> https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#podspec-v1-core
> Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified.
> 直接讓 pod port 與 host port 全部相通
> 此方法無需建立 service, 但 service 可直接設定 loadbalance 

- 在 Pod.Spec 中設定 hostNetwork:true, 會讓 pod 的所有 port 都直接對外
- 在 minikube 中，能直接用 node ip，原因應該是剛好
- 指定這個，最好也設定 `hostname`, 否則每次 pod 起來, host ip 都是隨機, 不會固定
- 但指定這個，似乎就無法設定 service 開放全部的 port

## hostPort
> 直接將容器的 port 與 host 的 port 相通
> 此方法無需建立 service, 但 service 可直接設定 loadbalance 
