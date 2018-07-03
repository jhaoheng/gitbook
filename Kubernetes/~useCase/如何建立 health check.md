# 狀況
- Pod 還在運行，但在 Pod 中的 web app container 可能因為某些原因已經停止運作，或是資源被其他 containers 佔用，導致我們送去的 request 無法正常回應。

# 解決方案
- Kubernetes 提供 Health Checks 協助去偵測 Pod 中的 containers 是否都還正常運作，確保服務本身也能正常運行。

# health check 有哪幾種
- 定期的透過指令去訪問 container
- 定期發送一個 HTTP request 給 container

> 範例 : 利用 Prob : https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#probe-v1-core

```
apiVersion: apps/v1 # for kubectl versions >= 1.9.0
kind: Deployment
metadata:
  name: hello-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-deployment
  template:
    metadata:
      labels:
        app: my-deployment
    spec:
      containers:
      - name: webapp
        image: zxcvbnius/docker-demo
        ports:
        - name: webapp-port
          containerPort: 3000
        livenessProbe:
          httpGet:
            path: /
            port: webapp-port
          initialDelaySeconds: 15
          periodSeconds: 15
          timeoutSeconds: 30  
          successThreshold: 1
          failureThreshold: 3
```

## Prob

- Exec : https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#execaction-v1-core
- httpGet : https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#httpgetaction-v1-core
	- path : 設定 health checks 要訪問的路徑
	- port : 指定我們要訪問的 port
- initialDelaySeconds : 設定當 service 剛啟動時，要延遲幾秒再開始做 health check
- periodSeconds : 代表每隔幾秒訪問一次，預設值為 10秒
- successThreshold : 可以設置訪問幾次就代表目前 service 還正常運行
- failureThreshold : 代表 service 回傳不如預期時，在 Kubernetes 放棄該 container 之前，會嘗試的次數，預設為3次。
- timeoutSeconds : 當執行 health check 時，沒有回應，設定逾期時間，預設是一秒
- tcpSocket : 