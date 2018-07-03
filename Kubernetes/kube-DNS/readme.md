# 驗證
> 建立好 service 後，如何驗證服務

- 驗證服務, 在 node 或者任何一個 pod 中, 執行 `dig <my-svc>.<my-namespace>.svc.cluster.local`
- 驗證端口, 在 node 或者任何一個 pod 中, 執行 `dig _<my-port-name>._<my-port-protocol>.svc.cluster.local`
- 驗證 Pod, `dig <pod-ip>.<my-namespace>.pod.cluster.local`

- 使用 nslookup
	1. `nslookup`
	2. 輸入 `_<my-port-name>._<my-port-protocol>.svc.cluster.local`