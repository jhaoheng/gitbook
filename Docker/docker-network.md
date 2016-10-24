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