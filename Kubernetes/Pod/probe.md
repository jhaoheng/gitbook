# Probe

- Probe 是由 kubelet 對容器執行的定期診斷。使用 Handler
	- https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#handler-v1-core
		- ExecAction : 在容器內執行命令。跟 docker 不同的是, 不會覆蓋掉本身 container 的 command
		- TCPSocketAction : 對指定端口上的容器 ip 進行 TCP 檢查。若 port 開啟，則診斷被認為是成功
		- HTTPGetAction : 對指定的端口與路徑上的容器 ip 地址進行 http get 的請求
- Probe 的策略有
	- livenessProbe : 判斷容器是否正在運行, 若沒在運行, 則 kubelet 會刪除容器, 且接下來受到『重啟策略』影響
	- readinessProbe : 判斷容器是否準備就緒, 若還沒準備好, 就會將與該 pod 匹配的 service 中, 暫時刪除匹配. 若不提供此 Probe, 則默認無論是否就緒, 都會建立連接管道

# liveness ex
```
apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: liveness-http
spec:
  containers:
    image: gcr.io/google_containers/liveness
    livenessProbe:
      httpGet:
        # when "host" is not defined, "PodIP" will be used
        # host: my-host
        # when "scheme" is not defined, "HTTP" scheme will be used. Only "HTTP" and "HTTPS" are allowed
        # scheme: HTTPS
        path: /healthz
        port: 8080
        httpHeaders:
          - name: X-Custom-Header
            value: Awesome
      initialDelaySeconds: 15
      timeoutSeconds: 1
    name: liveness
```
