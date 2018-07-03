# ingress-nginx
> https://github.com/kubernetes/ingress-nginx

- 說明 : `https://github.com/kubernetes/ingress-nginx/blob/master/docs/deploy/index.md`

## 安裝
1. 取得權限 `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user $(gcloud config get-value account)`
2. 依照說明安裝
3. 刪除 : `kubectl delete namespace/ingress-nginx`

- 建立好 ingress-nginx 後，會自動建立 ingress-nginx 的 loadbalancer


# ingress-gce
- 與 ingress-nginx 的比較 : https://medium.com/searchink-eng/kubernetes-ingress-gce-vs-nginx-controllers-1-3-d89d6dd3da73
- 使用 ingress-gce，必須要指定 service.type=NodePort