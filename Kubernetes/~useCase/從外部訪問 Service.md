# 訪問 service

- NodePort
- LoadBalancer

## NodePort
- 預設的 service 用的是 cluster ip, 此 ip 只能在 cluster 中進行訪問. 而 NodePort 是其中一種外部訪問方式
- nodePort (optional): 此設定只有在 spec.type 為 NodePort 或 LoadBalancer 才會存在
- 設定 NodePort, 外部使用方式是 <nodeIP>:nodePort, 範圍是 30000-32767
- 這種方式是透過 nodeip 所進行的 port mapping, 所以受限於 30000-32767 的範圍

```
kind: Service
apiVersion: v1
metadata:
  name: NodePort
spec:
  type: NodePort
  ports:
    - port: 8086
      nodePort: 30000
  selector:
    name: <>
```

# LoadBalancer

- 建立好服務後, 查詢 `kubectl get service/<name>` 來取得 CLUSTER-IP 與 10.13.242.236 
	- 內部 : 可透過 CLUSTER-IP 與相關的 port 進行連線

```
kind: Service
apiVersion: v1
metadata:
  name: LoadBalancer
spec:
  type: LoadBalancer
  ports:
    - port: 8086
  selector:
    name: <>
```
