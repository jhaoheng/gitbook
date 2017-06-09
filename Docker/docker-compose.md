- docker-compose -f : 指定 compose 的設定檔，可使用多個 -f，compose 將透過指令合併成一個 compose 檔案
	- ex : `docker-compose -f {f1} -f {f2}`
- docker-compose down : 等同於 docker rm -f {container_id}
	
# docker-compose yaml 格式

- officer : compose-versioning
- 在 docker-compose.yml 中，第一行設定的 version，為 compose 解析格式的版本號
- 不同的版本，支援不同的 tag

