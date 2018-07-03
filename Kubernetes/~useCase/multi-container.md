```
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: hello-server
spec:
  replicas: 1 # 觀察設定
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.7.9
        - name: maxtest
          image: mysql:latest
          env:
            - name: MYSQL_ALLOW_EMPTY_PASSWORD
              value: "yes"
```

- 如何在不建立服務的情況下 access 到 container 中?
	- kuberctl exec -it -c <ContainerName> <PodName> 