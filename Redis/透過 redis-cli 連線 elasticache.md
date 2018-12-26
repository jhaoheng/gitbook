# 透過 redis-cli 連線 elasticache

## 限制
1. 必須透過 aws ec2 進行連線 : 
	- From AWS FAQ: (http://aws.amazon.com/elasticache/faqs/)
Please note that IP-range based access control is currently not enabled for Cache Clusters. All clients to a Cache Cluster must be within the EC2 network, and authorized via security groups as described above.
2. 確定 elasticache 建立時的
	- endpoint
	- Subnet Group
	- Security - 
3. 確定 aws ec2 
	- 確保 instance 的 vpc 與 elasticache 的 Subnet Group 相同

## 安裝 redis-cli, 連線
1. `apt-get update && apt-get install gcc make -y`
2. `wget http://download.redis.io/redis-stable.tar.gz && tar xvzf redis-stable.tar.gz && cd redis-stable && make distclean && make`
3. (optional) `ln -s $(pwd)/src/redis-cli /bin/redis-cli`
4. connect : 
	- if (3) `redis-cli -c -h {endpoint} -p 6379`
	- `./src/redis-cli -c -h {endpoint} -p 6379`

## 透過 GUI 訪問
> 在相同的 ec2 上安裝

1. `apt-get update && apt-get install nodejs npm -y && ln -s $(which nodejs) /usr/bin/node && npm install -g redis-commander`
2. 執行服務 : `redis-commander --redis-host <elasticache endpoint>`
3. 確定 ec2 security 8081 port 可讓你目前的 ip 進行連線
4. 瀏覽器輸入 : <ec2-instance-ip>:8081
