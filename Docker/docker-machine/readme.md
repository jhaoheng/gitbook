# Overview

- Instsall and run Docker on Mac or Windows
- Provision and manage multiple remote Docker hosts
- Provision Swarm clusters
- 通過這個工具，可以很方便地將 docker 安裝在 docker-machine 上

# What is Docker Machine

Docker Machine is a tool that lets you install Docker Engine on virtual hosts, and manage the hosts with docker-machine commands. You can use Machine to create Docker hosts on your local Mac or Windows box, on your ompany network, in your data center, or on cloud providers like Azure, AWS, or Digital Ocean.

# docker machine driver
- https://docs.docker.com/machine/drivers/
- docker-machine 可適合的 driver 為上表所列，docker-machine 會將 docker 安裝在上述的平台中
- 在本地端使用 mac 電腦，透過 docker-machine 安裝 docker 到 別的平台上
	- 使用 docker-machine 與 aws 配合 : https://docs.docker.com/machine/drivers/aws/

# 安裝 docker-machine
