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
          ports:
          - containerPort: 80
        - name: nginx2
          image: nginx
          ports:
          - containerPort: 81
---
apiVersion: v1
kind: Service
metadata:
  name: hello-server
spec:
  selector:
    app: hello-server
  ports:
    - name: http-nginx
      protocol: TCP
      port: 80
      targetPort: 80
    - name: http-nginx2
      protocol: TCP
      port: 81
      targetPort: 81
  type: LoadBalancer # ClusterIP, NodePort, LoadBalancer, ExternalName
```

透過 `minikube service list` 可看到 pod 對外開啟的 ports