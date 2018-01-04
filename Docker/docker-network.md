docker network --help

docker network create [net-name]

docker network connect [net-name] [container-id]



## port



docker run --expose=7000-8000


docker run -p <public_port>:<private_port> -d <image>  
docker run -p 7000-8000:7000-8000

docker run -d --net=host myvnc

1. docker stop [container_id]
2. docker commit [container_id] [new_image]
3. docker rm [container_id]
4. docker run -d -P --name [container_id] [new_image]
	- `-P` : 設定所有的 port 對外

	
## 檢查

https://docs.docker.com/engine/userguide/networking/

1. 在本機上 ifconfig
2. docker run --network={bridge or host}
3. 運行 docker network inspect {bridge or host} 可看到掛載的 container
4. 進入 container 安裝 net-tools，運行 ifconfig 可看到 container 網卡
5. 在本機使用 `ping w3 {}`



# From inside of a Docker container, how do I connect to the localhost of the machine?


https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach