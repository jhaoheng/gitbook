# docker ps

## 只顯示 ps 中的幾個參數
docker inspect  -f "{{.Name}} {{.Config.Cmd}}" $(docker ps -a -q)