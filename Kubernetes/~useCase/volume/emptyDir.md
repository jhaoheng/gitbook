> 目的 : 建立在同一個 pod 底下共用的 volume 空間
> 但當 pod 被移除，則資料也會消失

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: dev
  template:
    metadata:
      labels:
        app: dev
    spec:
      containers:
        - name: app1
          image: ubuntu:16.04
          tty: true
          volumeMounts:
            - name: cache-volume
              mountPath: /cache
        - name: app2
          image: ubuntu:latest
          tty: true
          volumeMounts:
            - name: cache-volume
              mountPath: /cache
      volumes:
        - name: cache-volume
          emptyDir: {}
```