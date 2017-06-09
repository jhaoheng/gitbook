# AWS linux install docker & docker-compose

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

## install docker

```
sudo yum install
sudo yum install -y docker
sudo usermod -aG docker ec2-user
sudo service docker start
docker info // 判斷是否成功
```

- 注意 : `Cannot connect to the Docker daemon. Is the docker daemon running on this host?`
	- 需重啟 sudo reboot ，讓 docker 權限重新載入

## install docker-compose

```
sudo su
curl -L "https://github.com/docker/compose/releases/download/1.8.0/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
exit
docker-compose --version
```

