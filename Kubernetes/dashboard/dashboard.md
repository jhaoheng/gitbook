# minikube

- 執行 `minikube dashboard`

# 一般情況

## 安裝 Dashboard UI
> 一般 Kubernetes 預設並不會有 Dashboard 套件
> https://github.com/kubernetes/dashboard

1. 建立權限
	- 官網建議 : https://github.com/kubernetes/dashboard/wiki/Access-control#admin-privileges
		- 執行此資料夾下的 `kubectl create -f dashboard-admin.yml` 即可
	    - 登入 dashboard 時，無需驗證 token
	- 透過 user-name 來進行 bind : https://github.com/kubernetes/dashboard/issues/2415
		- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user $(gcloud config get-value account)`
	    - 登入 dashboard 時，需要驗證 token

2. 透過 kubectl apply 指令創建這個 Web UI component : 

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

3. 開啟 `kubectl proxy`
4. 開啟 http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
