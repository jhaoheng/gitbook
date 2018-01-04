# dockerfile

```
FROM        ubuntu:16.04

EXPOSE      5222 5280 5269 4560

WORKDIR     /home

ENV         DL=https://www.process-one.net/downloads/ejabberd/17.07/ejabberd_17.07-0_amd64.deb

ENV			EJABBERD_HOME_NAME=ejabberd-17.07
ENV         DL_FILENAME=$EJABBERD_HOME_NAME.deb 

RUN         apt-get update
RUN 		apt-get install libexpat1 apt-utils -y
RUN         apt-get install wget vim curl -y
RUN         wget -O $DL_FILENAME $DL
RUN         dpkg -i $DL_FILENAME
```


# docker-compose

- 要注意，要放入 hostname , domainname , network_mode 否則無找到 cluster
 並加入
 
```
version: '3.0'
services:
  ejabberd:
    image: quay.io/orbweb/ejabberd:17.07
    ports:
      - 4560:4560/tcp
      - 5222:5222/tcp
      - 5269:5269/tcp
      - 5280:5280/tcp
    network_mode: "host"
    tty: true
    container_name: ejabberd
    working_dir: /opt
    env_file: .env
    hostname: ${PUBLIC_IP}
    domainname: ""
    volumes:
      ## 對應到 pro/stg 的設定值，從 gnev 中設定
      - ../ejabberd_conf/${STG_OR_PRO}:${OUTSIDE_CONF_PATH}
      - ../ejabberd_conf/server.pem:/opt/server.pem
      - ./script:${OUTSIDE_SCRIPT_PATH}
    # command: /bin/sh -c '/opt/script/ejabberd_set.sh'
    entrypoint: sh ${OUTSIDE_SCRIPT_PATH}/entrypoint.sh
    ulimits:
      nproc: 10000
      nofile:
        soft: 10000
        hard: 10000
    restart: always
    # 放入 papertrail
```

# pre set

執行 docker-compose 前，要先設定基本參數

```
#!/bin/bash

## fill ARG
MODE='pro'
HOST='xmpp.orbweb.me'

## get xmpp-stg.orbweb.me ip, for join_cluster ejabberd@{cluster_ip}
code=$(curl --write-out %{http_code} --silent --output /dev/null $HOST:5280/api/status)
if [[ code -eq 200 ]]; then
    CLUSTER_GROUP=$(curl -s $HOST:5280/api/status | awk '{print $3}' | tr -d \')
    if [ -z $CLUSTER_GROUP ]; then
        echo "# => warning : Can not get $STG_OR_PRO public_ip." 
    fi
fi

## set public ip
PUBLIC_IP=$(curl -s --max-time 2 http://169.254.169.254/latest/meta-data/public-ipv4)
if [ -z "$PUBLIC_IP" ]; then
    echo "# => warning : AWS PUBLIC_IP can not get, use [localhost] to replace"
    ## use ejabberd default localhost, so dont need to change anything
fi

docker_HOME='/home/ubuntu/ejabberd/docker'
echo 'HOST='$HOST                       >> $docker_HOME/.env | tee
echo 'STG_OR_PRO='$MODE                 >> $docker_HOME/.env | tee 
echo 'CLUSTER_GROUP='$CLUSTER_GROUP     >> $docker_HOME/.env | tee 
echo 'PUBLIC_IP='$PUBLIC_IP             >> $docker_HOME/.env | tee 
echo 'OUTSIDE_CONF_PATH=/opt/_conf'     >> $docker_HOME/.env | tee
echo 'OUTSIDE_SCRIPT_PATH=/opt/script'  >> $docker_HOME/.env | tee
cat $docker_HOME/.env


docker login -u="orbweb+ejabberd" -p="VJ0GOSOI65SHI0T0GARS0RN1NBKXGMXXD65MP4RNDKCB7ETE9QUSMV1BOULF5Y24" quay.io
cd /home/ubuntu/ejabberd/docker && \
sudo docker-compose up -d
```