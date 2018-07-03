> 當 pod 被移除, volume 依然存在, 除非 node 被移除掉

1. 建立環境

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      run: app
  template:
    metadata:
      labels:
        run: app
    spec:
      containers:
        - name: my-app
          image: ubuntu:16.04
          tty: true
          volumeMounts:
            - name: hostpath
              mountPath: /tmp
      volumes:
        - name: hostpath
          hostPath:
            path: /tmp
            type: Directory
```

2. 進入 node:minikube, `minikube ssh`
	- 進入 `cd /tmp`
3. 進入 pod:container 中, `kubectl exec -it <node> /bin/bash` 
	- 進入 `cd /tmp`