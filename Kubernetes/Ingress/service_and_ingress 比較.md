https://hk.saowen.com/a/9ec7f1b15289696c0f8ae73af2f182a7bdc5296ac7a24249eaeddd4dae44e738


# 費率
- sercvice.loadbalancer : 一個服務就是一個 loadbalancer
- ingress : 透過內部的服務，建立起 loadbalancer x 1, 可根據 path 來接入所有的 service name, 也就是共用一個 loadbalancer
	- 使用Ingress能夠允許你將loadbalancer的個數降低到最少

# 管理
- service : 一個 config 對應一個服務器集群
- ingress : 一個 config 可以對應多種不同的服務集群, 有點類似 DNS manager, 透過 path 來指定

# TLS
- ingress : 可以直接針對 ssl 進行管理