# Compose配置文件介紹
此文主要描述Docker Compose file version 3 格式，第三版本會和1x,2x有很多不同。
https://docs.docker.com/compose/compose-file/

## 一、服務配置
Compose文件是一個 `YAML` 文件，用於定義服務，網絡和數據卷等。 Compose文件的默認路徑為 `./docker-compose.yml`。

Compose作服務編排，簡單的說，就是把 `docker run` 的一堆啓動參數文件化，使一條命令(`docker-compose up`)完成多個容器的構建啓動成為可能。
透過 `docker-compose down`, `docker-compose stop`, `docker-compose start` 來操作所有容器

## build
顧名思義，就是構建鏡像，可以指定 `Dockerfile` 路徑，構建參數等。

```
build: ./dir
build:
  context: ./dir
  dockerfile: Dockerfile-alternate
  args:
    buildno: 1
注：如果這個 compose 文件是用來部署一個 stack 到 swarm 節點，這個選項就不能有，因為 docker stack 命令只接受已經構建的鏡像
```

## context
指定 Dockerfile 路徑，可以是本地文件(絕對路徑或者相對路徑)，or a url to a git repository.

```
build:
  context: ./dir
```

## dockerfile
如果上例子指定的 dockerfile 名字不叫 Dockerfile，可以通過該指令給出。

```
build:
  context: .
  dockerfile: Dockerfile-alternate
```

## args
用於構建階段的參數

First, specify the arguments in your Dockerfile:
```
ARG buildno
ARG password

RUN echo "Build number: $buildno"
RUN script-requiring-password.sh "$password"
```

Then specify the arguments under the build key. You can pass either a mapping or a list:
```
build:
  context: .
  args:
    buildno: 1
    password: secret

build:
  context: .
  args:
    - buildno=1
    - password=secret
```

你可以在設定 args 時，不帶任何 value，而 compose 在運行時，會帶入 compose 運行時的參數

> Note : YAML 的 bollean values (true, false, yes, no, on, off)，必須用 "" 來包圍該參數，才會被認定為 string

## CACHE_FROM

利用鏡像中的 History 來判斷該層是否和之前的鏡像一致，從而避免重復構建。
> Note : v3.2 才有這個選項

```
build:
  context: .
  cache_from:
    - alpine:latest
    - corp/web_app:3.14
```

## cap_add, cap_drop
添加或者刪除容器功能

cap_add:
  - ALL
cap_drop:
  - NET_ADMIN
  - SYS_ADMIN
注：stack 部署會忽略該選項。
> Note: These options are ignored when deploying a stack in swarm mode with a (version 3) Compose file.

## command
覆蓋鏡像默認的command

```
command: bundle exec thin -p 3000
# 可以是一個list, in a manner similar to dockerfile:
command: [bundle, exec, thin, -p, 3000]
```

## cgroup_parent
為容器指定父 cgroup

```
cgroup_parent: m-executor-abcd
```
注：stack 部署會忽略該選項。
> Note: This option is ignored when deploying a stack in swarm mode with a (version 3) Compose file.

## container_name
默認自動為容器命名，可以通過該選擇指定。

```
container_name: my-web-container
```

> Note : 容器的自定義名稱是唯一的，如果使用了此選項，在自動擴展多個 container 的服務外，會產生錯誤

## deploy

> version 3 only

Specify configuration related to the deployment and running of services. This only takes effect when deploying to a swarm with docker stack deploy, and is ignored by `docker-compose up` and `docker-compose run`.
部署相關配置，如部署數量，重啓策略。如果通過 `docker-compose run` 啓動，會自動忽略該配置。

```
version: '3'
services:
  redis:
    image: redis:alpine
    deploy:
      replicas: 6
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
```
注：只支持version 3
**這邊開始**
## mode
Either global (exactly one container per swarm node) or replicated (a specified number of containers). The default is replicated.
如果配置為 `globle` ,表示所有swarm節點都有一個容器，如果配置為 `replicated`，可以指定容器數量，默認為 `replicated`

```
mode: global
```

## replicas
如果服務 mode 配置為 `replicated` , `replicas`就是用來指定容器數量的

```
mode: replicated
replicas: 6
```

## placement
指定容器的放置約束。

```
placement:
  constraints:
    - node.role == manager
    - engine.labels.operatingsystem == ubuntu 14.04
```

## update_config
服務更新配置：

- parallelism: 同事update的容器數
- delay: 一組容器update時間隔時間
- failure_action: 如果1個容器更新失敗，是繼續(continue)還是暫停(pausem default)
- monitor: 每次任務後，監視故障的持續時間
- max_failure_ratio: 升級的最大失敗次數

```
update_config:
     parallelism: 2
     delay: 10s
```

## resources
配置資源約束。 這將替換版本3之前的文件中的舊資源約束選項（cpu_shares，cpu_quota，cpuset，mem_limit，memswap_limit）。

```
resources:
  limits:
    cpus: '0.001'
    memory: 50M
  reservations:
    cpus: '0.0001'
    memory: 20M
```

## restart_policy
Configures if and how to restart containers when they exit. Replaces restart.

配置容器退出時的啓動策略。替換 `restart`

- condition: `none` , `on-failure` , 或者 `any` (默認: any).
- delay: 重啓間隔(default: 0).
- max_attempts: 最大重啓次數 (default: never give up).
- window: 在決定重新啓動是否成功之前等待的時間，default: decide immediately).

```
restart_policy:
      condition: on-failure
      delay: 5s
      max_attempts: 3
      window: 120s
```

## labels
指定服務的標籤。 這些標籤只能在服務上設置，而不能在服務的任何容器上設置。

```
version: "3"
services:
  web:
    image: web
    deploy:
      labels:
        com.example.description: "This label will appear on the web service"
```

在deploy外設置

```
version: "3"
services:
  web:
    image: web
    labels:
      com.example.description: "This label will appear on all containers for the web service"
```

## devices
列出devices

```
devices:
  - "/dev/ttyUSB0:/dev/ttyUSB0"
```
注：stack 部署會忽略該選項。

## depends_on
服務依賴，如果使用 `docker-compose up` 啓動，也將會啓動所依賴的服務。

```
version: '2'
services:
  web:
    build: .
    depends_on:
      - db
      - redis
  redis:
    image: redis
  db:
    image: postgres
```
注：depends_on 不會等待所依賴的服務啓動完成後再啓動，因為無法判斷一個服務是否已經啓動完成。
可以結合 `healthcheck` 判斷服務健康狀態。但注意只在 `2.1` 版本中, 後文會介紹到。

```
version: '2.1'
services:
  web:
    build: .
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
  redis:
    image: redis
  db:
    image: redis
    healthcheck:
      test: "exit 0"
```

## dns
指定dns服務

```
dns: 8.8.8.8
dns:
  - 8.8.8.8
  - 9.9.9.9
```

注：stack 部署會忽略該選項。

## dns_search
指定dns domain

```
dns_search: example.com
dns_search:
  - dc1.example.com
  - dc2.example.com
```
注：stack 部署會忽略該選項。

## tmpfs
掛載一個臨時目錄到容器

```
tmpfs: /run
tmpfs:
  - /run
  - /tmp
```
注：stack 部署會忽略該選項。

## entrypoint
覆蓋默認的 entrypoint

```
entrypoint: /code/entrypoint.sh
entrypoint:
    - php
    - -d
    - zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20100525/xdebug.so
    - -d
    - memory_limit=-1
    - vendor/bin/phpunit
```
注：這會覆蓋任何鏡像ENTRYPOINT默認的entrypoint，如果dockerfile只有一個CMD指令，他將被忽略。

## env_file
通過文件添加環境變量，將覆蓋默認的變量。

```
env_file: .env
env_file:
  - ./common.env
  - ./apps/web.env
  - /opt/secrets.env
```
一行一個key=value，以#開頭的會被忽略
```
# Set Rails/Rack environment
RACK_ENV=development
```
注：如果您的服務指定了構建選項，則在構建期間不會自動顯示環境文件中定義的變量。 使用build的args子選項來定義構建時環境變量。
值只能是一個值，不能是變量。

## environment
添加環境變量。如果是boolean，注意引號的使用方式。

```
environment:
  RACK_ENV: development
  SHOW: 'true'
  SESSION_SECRET:
environment:
  - RACK_ENV=development
  - SHOW=true
  - SESSION_SECRET
```
注：如果您的服務指定了構建選項，則在構建期間將不會自動顯示在環境中定義的變量。 使用build的args子選項來定義構建時環境變量。

## expose
暴露端口給主機。

```
expose:
 - "3000"
 - "8000"
```

## extends
在當前文件或另一個文件中擴展另一個服務，可選地覆蓋配置。

您可以在任何服務上使用擴展與其他配置鍵。 extends值必須是使用必需的服務和可選文件鍵定義的字典。

```
extends:
  file: common.yml
  service: webapp
```
如果省略文件 Compose 在當前文件中查找服務配置。 文件值可以是絕對路徑或相對路徑。 如果指定相對路徑，則Compose將其視為相對於當前文件的位置。

不支持循環引用。

注：部署到stack時不支持該選項，可以通過 `docker-compose config` 生成配置再部署

## external_links
連接 `docker-compose.yml` 外的服務

```
external_links:
 - redis_1
 - project_db_1:mysql
 - project_db_1:postgresql
```
注：如果使用version 2和以上版本，至少有一個外部容器和他共用相同網絡。部署到stack時會被忽略。

## extra_hosts

```
extra_hosts:
 - "somehost:162.242.195.82"
 - "otherhost:50.31.209.229"
```

## group_add
> Version 2 file format and up.
添加組，組必須同時存在於要添加的容器和主機系統中。

```
version: '2'
services:
    image: alpine
    group_add:
      - mail
```

## healthcheck
> Version 2.1 file format and up.
配置容器啓動監控檢查：

```
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
```

```
# Hit the local web app
test: ["CMD", "curl", "-f", "http://localhost"]
# As above, but wrapped in /bin/sh. Both forms below are equivalent.
test: ["CMD-SHELL", "curl -f http://localhost && echo 'cool, it works'"]
test: curl -f https://localhost && echo 'cool, it works'
#禁用
healthcheck:
  disable: true
```

## image
指定鏡像：格式可以有以下幾種

```
image: redis
image: ubuntu:14.04
image: tutum/influxdb
image: example-registry.com:4000/postgresql
image: a4bc65fd
```

##labels
給容器添加元數據

```
labels:
  com.example.description: "Accounting webapp"
  com.example.department: "Finance"
  com.example.label-with-empty-value: ""
labels:
  - "com.example.description=Accounting webapp"
  - "com.example.department=Finance"
  - "com.example.label-with-empty-value"
```

## links
容器間的連接：

```
web:
  links:
   - db
   - db:database
   - redis
```

其實就是在容器中的 `/etc/hosts` 添加容器id和別名的映射。

如果同時配置了link是和networks，至少有一個共用的網絡。
部署到stack會被忽略

## logging
Logging configuration for the service.
記錄服務的日誌：

```
logging:
  driver: syslog
  options:
    syslog-address: "tcp://192.168.0.42:123"
driver: "json-file" # default
driver: "syslog"
driver: "none"
```
注：只有使用json-file和journald時，可以通過docker-compose logs 查看日誌。其他方式將不打印任何日誌

## network_mode
網絡模式。和docker run -net 拒用相同功能。

```
network_mode: "bridge"
network_mode: "host"
network_mode: "none"
network_mode: "service:[service name]"
network_mode: "container:[container name/id]"
```

注：部署stack時會被忽略

## networks
引用頂級網絡配置的條目

```
services:
  some-service:
    networks:
     - some-network
     - other-network
```

# ipv4_address, ipv6_address
給容器指定靜態ip。和networks結合使用。

```
version: '2.1'
services:
  app:
    image: busybox
    command: ifconfig
    networks:
      app_net:
        ipv4_address: 172.16.238.10
        ipv6_address: 2001:3984:3989::10
networks:
  app_net:
    driver: bridge
    enable_ipv6: true
    ipam:
      driver: default
      config:
      - subnet: 172.16.238.0/24
        gateway: 172.16.238.1
      - subnet: 2001:3984:3989::/64
        gateway: 2001:3984:3989::1
```

## ports
容器和主機的端口映射

```
ports:
 - "3000"
 - "3000-3005"
 - "8000:8000"
 - "9090-9091:8080-8081"
 - "49100:22"
 - "127.0.0.1:8001:8001"
 - "127.0.0.1:5000-5010:5000-5010"
 - "6060:6060/udp"
```

# volumes
數據卷掛載

```
version: "3"
services:
  db:
    image: db
    volumes:
      - data-volume:/var/lib/db
  backup:
    image: backup-service
    volumes:
      - data-volume:/var/lib/backup/data
volumes:
  data-volume:
```