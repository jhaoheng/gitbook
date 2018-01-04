version: '3'
services:
  redis:
    image: redis
    container_name: redis

  redis-admin:
    container_name: redis-admin
    build: ./redis-admin
    image: redis-commander  
    ports:
      - 8081:8081/tcp
    command: redis-commander --redis-host 192.168.47.133