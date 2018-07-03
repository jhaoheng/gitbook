1. `cat ssl.key | base64`, 顯示出字串
2. 建立 secret, 下方, `kubectl create -f secret.yaml`

```
apiVersion: v1
kind: Secret
metadata:
	name: "ssl-certificate"
data:
	server-crt: "..base64.."
	server-key: "..base64.."
```

或者使用 `kubectl create secret generic ssl-certificate --from-file=server-crt=/path/to/xxx.crt --from-file=server-key=/path/to/xxx.key`

## 如何讓 pod 使用
1. 透過 volume 的方式掛載進去
> 使用 containers[].volumeMounts[] 與 podspec.volumes[]

2. 透過 containers.env[] 的方式掛載進去 

ex: 

1. 建立 secret user : `kubectl create secret generic <name> --from-literal=<key>=<value>`
	- `kubectl create secret generic user --from-literal=name=max --from-literal=gender=male`
2. 建立 secret ssl, 須先建立 ssl.crt & ssl.key
	- `kubectl create secret generic ssl --from-file=server-crt=/path/to/xxx.crt --from-file=server-key=/path/to/xxx.key`

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
        - name: app
          image: nginx:latest
          volumeMounts:
            - name: ssl-mount
              mountPath: "/etc/secret-volume"
          env:
            - name: username
              valueFrom: 
                secretKeyRef:
                  name: user
                  key: name
            - name: usergender
              valueFrom: 
                secretKeyRef:
                  name: user
                  key: gender
      volumes:
        - name: ssl-mount
          secret:
            secretName: ssl
```


