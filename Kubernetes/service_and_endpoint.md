1. 當 service 一般啟用時, 帶有 selector, 此時就會建立一組 endpoint, 可用 `kubectl get endpoint` 查看
	- `pod<--->endpoint<--->service`
2. 但在哪些情況下, 需要手動設定 endpoint?
	- You want to have an external database cluster in production, but in test you use your own databases.
	- You want to point your service to a service in another Namespace or on another cluster.
	- You are migrating your workload to Kubernetes and some of your backends run outside of Kubernetes.

## 範例 : 不使用 selector 的情境 

### 情境一 : 外部特定的服務
- service, 不使用 selector 來指定 pods

```
kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376
```

- 建立 endpoint, 指定 ip:1.2.3.4 對應到 port 9376. 此時只需 http://dns:80, 就對對應到 1.2.3.4:9376

```
kind: Endpoints
apiVersion: v1
metadata:
  name: my-service
subsets:
  - addresses:
      - ip: 1.2.3.4
    ports:
      - port: 9376
```

- 在這種設定情況下, 可以針對外部的資料庫或者不同的 namespace/cluster 來進行配對, ex : 
	- 有 stg/pro 資料庫, 在相同 pod 中 
	- 透過不同 service 的建立, 會將 port 轉到內部特定的資料庫位置上, 但只能指定固定 ip ... 彈性不夠好

### 情境二 : 透過 externalName 來取代 selector
> 在 externalName 的設定下, 無需指定任何 port 或者 endpoint
> 可以直接連接到外部服務的一種方式

```
kind: Service
apiVersion: v1
metadata:
  name: my-service
  namespace: prod
spec:
  type: ExternalName
  externalName: my.database.example.com
```

- 應用範例 : 
	- 在 pod 中, 使用 <my-svc>.<namespace>.svc.cluster.local, 就會直接接到 my.database.example.com 上
