參考 ~usecase/ingress

service 的設定，似乎一定要 NodePort

# metadata.annotations
- 所有的 annotations 設定格式，都跟 ingress-controller 相關 :
	- 預設的 ingress-gce 是不用安裝，若安裝額外的 ingress-controller，需在 metadata.annotations 中指定 ingress-controller
	- 原因參考 : http://blog.chronos-technology.nl/post/disabling-gke-load-balancer-in-kubernetes/
- 設定錯誤，會造成路由的設定 無法啟動

## ingress.yml 設定須知
- metadata.annotations 中，需加入 `kubernetes.io/ingress.class: "nginx"`
	- 或者直接關閉在 gcp 上的 loadbalancer

## traefik
> https://docs.traefik.io/configuration/backends/kubernetes/

## ingress-nginx
> https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/nginx-configuration/annotations.md

# 設定固定 ip
> 只適用 gcp : https://github.com/kelseyhightower/ingress-with-static-ip