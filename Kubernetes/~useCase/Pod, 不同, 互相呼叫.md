# 不同 pod 互相呼叫
1. 透過 pod 建立後的 ip, 可直接透過另一個 pod 直接呼叫
2. 透過 service name : 建立好的 pod 與 service 結合，可透過 service name 進行呼叫
3. 透過 service 建立好的 dns name `<my-svcName>.<my-namespace>.svc.cluster.local`

## 原理 1

## 原理 2
- 此方式可以讓不同的 pod 互相溝通, 且在 yaml 中，可直接設定
	- 透過 Service.metadata.name 的設定, 可以讓不同的 Pod 直接呼叫該 serviceName, 就可以達到相同效果

## 原理 3
> https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/

- kube-dns 幫助在同一個 Kubernetes Cluster 中的所有 Pods ，都能透過 Service 的名稱找到彼此。 
- 如何驗證?
	- 建立一個 pod 與其 service
	- 進入 container 中
	- `cat /etc/resolve.conf` 可看到設定的 dns
	- 所以此台的 dns 就是 `<my-svcName>.<my-namespace>.svc.cluster.local`
	- ex : `http://php-apache.default.svc.cluster.local`


## ex

1. 建立

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-world
spec: # DeploymentSpec
  selector:
    matchLabels:
      app: test
  replicas: 1 
  template: # PodTemplateSpec
    metadata:
      labels:
        app: test
    spec: # PodSpec
      containers:
        - name: nginx
          image: nginx:latest
          # tty: true
---
apiVersion: v1
kind: Service
metadata:
  name: hello-world # 主要是這個, 透過 metadata.name 來定義
spec:
  selector:
    app: test
  ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer # ClusterIP, NodePort, LoadBalancer, ExternalName
```

2. 驗證
	1. 建立新容器 : `kubectl run -it curl --image=appropriate/curl /bin/sh`
		- 執行 `curl -X GET http://hello-world.default.svc.cluster.local`
	2. pod 間溝通, 用不到 service 服務
