# synopsis
> https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#lifecycle-v1-core

- container[].lifecycle

```
lifecycle:
  postStart:
    exec:
      command: ["/bin/sh", "-c", "echo $(hostname -I) > /tmp/start"]
  preStop:
    exec: 
      command: ["/bin/sh", "-c", "echo $(hostname -I) > /tmp/stop"]
```

# ex
> my-deployment.yml

- 當建立時，在 node 中的 /tmp 會建立 start 的文字檔，並在其中寫入 pod ip
- 當停止時，在 node 中的 /tmp 會建立 stop 的文字檔，並在其中寫入 pod ip