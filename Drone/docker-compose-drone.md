# docker-compose

- drone-server : 主機管理介面
- drone-agent : 執行的 client 端
- 滿足 multi-agent, one host
- drone 整合不同的版本控制平台，可參考的設定參數 : http://docs.drone.io/install-for-github/ 

## drone-server

```
version: '3'
services:
  drone-server:
    image: drone/drone:0.8

    ports:
      - 80:8000
      - 9000
    volumes:
      - /var/lib/drone:/var/lib/drone/ # 給予一個持久性的儲存空間，是為了存放 sqlite database，不至於當 container 離開後，造成資料的遺失
    restart: always
    environment:
      - DRONE_OPEN=true					# drone 註冊預設是被關閉的狀態，開啟的原因是因為透過 github oauth 認證
      - DRONE_HOST=${DRONE_HOST} 		# 必須提供一個連接的 host，設定的格式為 '{scheme}://{hostname}'，請忽略最後的 '/'，{hostname} 可用 {ip} 替代
      - DRONE_SECRET=${DRONE_SECRET} 

      # 此範例是以 github 進行整合操作，Drone 本身可以整合多種不同的版本控制
      # 必須先到 github 中，取得 repo
      - DRONE_GITHUB=true
      - DRONE_GITHUB_CLIENT=${DRONE_GITHUB_CLIENT}
      - DRONE_GITHUB_SECRET=${DRONE_GITHUB_SECRET}


      # 授權管理的帳號，此處為 github 的 username (optional)
      - DRONE_ADMIN=					
      
      # 支援 ssl (optional)
      - DRONE_SERVER_CERT=/etc/certs/drone.domain.com.crt
      - DRONE_SERVER_KEY=/etc/certs/drone.domain.com.key
```

## drone-agent

```
version: '3'
services:
  drone-agent:
    image: drone/agent:0.8

    command: agent
    restart: always
    depends_on:
      - drone-server
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # 要求存取 docker daemon
    environment:
      - DRONE_SERVER=drone-server:9000 # 可設定 {ip}:9000，{ip} 可以是對外，agent 與 server 可以分開設定
      - DRONE_SECRET=${DRONE_SECRET}   # drone-server 的密碼
```

# drone-server optional

## 支援 ssl
``` 
ports:
	- 443:443
volumes:
	- ${SSL_PATH}:/etc/certs:rw
environment:
	- DRONE_SERVER_CERT=/etc/certs/drone.domain.com.crt
	- DRONE_SERVER_KEY=/etc/certs/drone.domain.com.key
```

