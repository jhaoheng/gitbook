1. git clone https://github.com/facebook/augmented-traffic-control.git
2. cd augmented-traffic-control/docker
3. docker build -t="${USER}/atc" .


docker run -it --privileged --network=host --rm -e ATCD_LAN=en4 -e ATCD_WAN=en0 ${USER}/atc

ifconfig 查看網路，需有兩張網卡被啟動
設定 lan 為 wifi , wan 為 ethernet