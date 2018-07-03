# StateFulSet

- 所有透過 deployment 所建構的 pod，都是屬於無狀態的服務。為了解決『有狀態的服務』配置，應用場景有
	- 穩定的持久化存儲，即 Pod 重新調度後還是能訪問到相同的持久化數據，基於 PVC 來實現
	- 穩定的網絡標誌，即 Pod 重新調度後其 PodName 和 HostName 不變，基於 Headless Service（即沒有 Cluster IP 的 Service）來實現
	- 有序部署，有序擴展，即 Pod 是有順序的，在部署或者擴展的時候要依據定義的順序依次依次進行（即從0到N-1，在下一個 Pod 運行之前所有之前的 Pod 必須都是 Running 和 Ready 狀態），基於init containers來實現
	- 有序收縮，有序刪除（即從N-1到0）
	- StatefulSet是一個給Pod提供唯一標誌的控制器，它可以保證部署和擴展的順序。

- 適用於
	- ejabberd/emqttd/beanstalkd 有 master node 的服務, 有順序的擴充與刪除
	- 需要穩定的 volume_儲存/network_id

# 參考
1. https://www.kubernetes.org.cn/statefulset
2. https://kubernetes.io/cn/docs/tutorials/stateful-application/basic-stateful-set/