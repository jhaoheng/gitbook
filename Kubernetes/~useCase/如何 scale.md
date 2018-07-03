# scale
`kubectl scale --help`
`kubectl scale --replicas=3 deploment/<name> --record` : 記得要 --record, 目的在於紀錄版本需求

# autoscaling
> 說明 : https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
> 服務名稱叫做 Horizontal Pod Autoscalers, hpa
> ex : `kubectl autoscale deployment/<name> --cpu-percent=50 --min=1 --max=10`
> 	- 執行 cpu > 50% 時擴增, 最大到 10
> 預設的 --cpu-percent 是 80%

## 取得 hpa
- `kubectl get hpa`
- `kubectl get hpa/<name>`

## 描述 hpa
- `kubectl describe hpa`
- `kubectl describe hpa/<name>`

## 刪除
- `kubectl delete hpa --all`
- `kubectl delete hpa/<name>`

## yaml
```
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: php-apache
spec:
  maxReplicas: 10
  minReplicas: 1
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: php-apache
  targetCPUUtilizationPercentage: 50
```