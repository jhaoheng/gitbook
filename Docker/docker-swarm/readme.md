# flow

1. 透過 docker-machine 來控制多台 docker engine
2. 透過 docker-swarm 來整合多台 docker engine 資源
3. 透過 docker-compose 來配置多個 docker 之間的溝通

# log

所以基本上就是 必須建立一個 docker swarm 的機器
透過 cli 與 swarm 的機器進行溝通，swarm 會透過規則建立 container

swarm 是一個鏡像

# swarm 的節點策略選擇
1. spread : 最少的容器，並且忽視他們的狀態，默認使用
2. binpack : 最擁擠（利用最少的 cpu/ram）
3. random : 隨機


