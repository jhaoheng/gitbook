# synopsis

將配置環境儲存於環境變數中，降低 Configuration 與程式碼的耦合，減少環境代碼被交付在程式碼的情況。然而，將環境代碼與程式碼分開之後，我們也會面臨到另外一個問題：環境代碼(Configuration)可能通常都散落在各地，必須有個的地方統一管理這些環境代碼。更糟的是，每個環境代碼可能都因應不同的程式語言，有著不同的格式，也使得統一管理更加困難。

而 Kubernetes 本身提供了一個 API - ConfigMap ，不但提供一個 Configuration 可以統一存放的地方，也提供一個方法讓開發者可以動態且代碼化的方式為每個應用服務配置其相對應的 Configuration。

# 比較 ConfigMap 與 Secret 的差別
- Secret 與 ConfigMap 想解決的面向不太相同，
- Secrets : 我們可以將機密的資料存在 Secret 中，且 Secret 會將這些值經過 Base64 加密，機密的資料像是 API 或是 database 的密碼
- ConfigMap : 而將非機密但屬於部署面的資料放在 ConfigMap，好比資料庫的 port number 或是 Redis 的 config file。

# ConfigMap 特點
- 一個 ConfigMap 物件可以存入整個 configuration, 像是 webserver config file, Nginx config file
- 無需修改 container 程式碼, 可以替換不同環境的 Config. 開發過程中, 常因應不同的環境需配置不同的 configuration，像是 staging 與 production 存取的資料庫位址不一致等等. 無需修改程式碼的特點，可以幫助我們更快部署到各個不同的環境中.
- 統一存放所有的 configuration, 透過 kubectl get 指令快速查看目前系統所有的 ConfigMap.

# 範例

## 建立 configmap
1. my-nginx.conf

```
server {
    listen       80;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

}
```

2. `kubectl create configmap nginx-conf --from-file=...`
3. 查詢 : `kubectl describe configmap/<name>`


## 建立 pod/service
1. my-pod.yaml

```
apiVersion: v1
kind: Pod
metadata:
  name: apiserver
  labels:
    app: webserver
    tier: backend
spec:
  containers:
    - name: nginx
      image: nginx:1.13
      ports:
        - containerPort: 80
      volumeMounts:
        - name: nginx-conf-volume
          mountPath: /etc/nginx/conf.d
  volumes:
    - name: nginx-conf-volume
      configMap:
        name: nginx-conf
        items:
          - key: my-nginx.conf
            path: my-nginx.conf
---
apiVersion: v1
kind: Service
metadata:
  name: my-apiservice
spec:
  selector:
    app: webserver
  ports:
    - targetPort: 80
      port: 80
  type: LoadBalancer
```

2. `kubectl create -f my-pod.yaml`
3. `minikube service list`
