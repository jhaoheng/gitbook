# env 環境變數

當用 docker 設定環境變數
docker 會將變數透過 bash 建立變數，並將 變數 export
故在設定 docker env 後，運行 docker，可以透過 `export -p` 查看所有環境變數

# index.php

```
<?php  
echo getenv("helloEnv").PHP_EOL;
echo getenv("go").PHP_EOL;
```

# step

```
docker pull jhaoheng/php_env:v1.2
// 建立 container, 設定 env
docker run -dt -e "helloEnv=sure" -e "go=ok" [image_id]
// 查看 container 中的環境變數
docker exec d11d88d32 bash -c export -p
// 放入 index.php
docker cp index.php [container_id]:/home
// 透過 php 取得環境變數
docker exec [container_id] php /home/index.php
```