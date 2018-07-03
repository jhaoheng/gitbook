# Label

- Label是附著到object上（例如Pod）的鍵值對。可以在創建object的時候指定，也可以在object創建後隨時指定。Labels的值對系統本身並沒有什麼含義，只是對開發者才有意義
- Kubernetes最終將對labels最終索引和反向索引用來優化查詢和watch，在UI和命令行中會對它們排序。不要在label中使用大型、非標識的結構化數據，記錄這樣的數據應該用annotation。
- Label能夠將組織架構映射到系統架構上，可以給object打上如下類型的label：
	- "release" : "stable", "release" : "canary"
	- "environment" : "dev", "environment" : "qa", "environment" : "production"
	- "tier" : "frontend", "tier" : "backend", "tier" : "cache"

# 組成
- key
	- 不得超過63個字符
	- 可以使用前綴，使用/分隔，前綴必須是DNS子域，不得超過253個字符，系統中的自動化組件創建的label必須指定前綴，kubernetes.io/由kubernetes保留
	- 起始必須是字母（大小寫都可以）或數字，中間可以有連字符、下划線和點
- value
	- 不得超過63個字符
	- 起始必須是字母（大小寫都可以）或數字，中間可以有連字符、下划線和點

# Label selector
- Label不是唯一的，很多object可能有相同的label。
- 通過label selector，客戶端／用戶可以指定一個object集合，通過label selector對object的集合進行操作。
- Label selector有兩種類型：
	- equality-based ：可以使用=、==、!=操作符，可以使用逗號分隔多個表達式
	- set-based ：可以使用in、notin、!操作符，另外還可以沒有操作符，直接寫出某個label的key，表示過濾有某個key的object而不管該key的value是何值，!表示沒有該label的object

> kubectl

```
$ kubectl get pods -l environment=production,tier=frontend
$ kubectl get pods -l 'environment in (production),tier in (frontend)'
$ kubectl get pods -l 'environment in (production, qa)'
$ kubectl get pods -l 'environment,environment notin (frontend)'
```

> api

```
selector:
  matchLabels:
    component: redis
  matchExpressions:
    - {key: tier, operator: In, values: [cache]}
    - {key: environment, operator: NotIn, values: [dev]}
```

> 另外在node affinity和pod affinity中的label selector的語法又有些許不同，示例如下：

```
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/e2e-az-name
            operator: In
            values:
            - e2e-az1
            - e2e-az2
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 1
        preference:
          matchExpressions:
          - key: another-node-label-key
            operator: In
            values:
            - another-node-label-value
```