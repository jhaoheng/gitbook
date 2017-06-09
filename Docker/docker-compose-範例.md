# docker-compose.yml
```
version: '3'
services:
  dynamodb:
    build:
      context: ./local-dynamoDB/
      dockerfile: Dockerfile
    image: orb_dynamodb:latest
    ports:
      - 8000:8000/tcp
    tty: true
    container_name: o_dynamodb
    volumes:
      - ~/Documents/tmp_file:/usr/share/nginx/html/tmp_file
```

## build
若使用這個 tag 則會在 docker-compose 建立時，會先去參考 ./local-dynamoDB/Dockerfile 的文件，並且建立一個新的 images

## image
若使用這個 tag，則會先參考 docker 中是否有此 image
若同時使用 tag:build，則在沒有此 image 時，透過 build 建立 image，並且建立後，給予設定 tag:image 時的名稱

## ports
設定 run 時，對外開放的 port, <外部 ip>:<container ip>

## tty

## container_name
設定 container 被建立時，設定的名稱

## volumes

<本地端路徑>:<docker 端路徑>
若設定此功能，原本 docker folder 中的 file 會被清空