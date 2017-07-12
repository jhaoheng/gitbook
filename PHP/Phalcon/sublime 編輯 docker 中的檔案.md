# sublime 編輯 docker 中的檔案

docker 是個好物的原因在於，環境的穩定，無論遷移到哪個環境中，都可以保持穩定性
debug 也方便許多

但如何直接編輯 docker 建立後的 file？
透過 docker 中的 volume 設定好 application 與 docker 中的位置，就可以直接動態變更 docker 中的檔案資訊

# ex : php / phalcon / docker

**Docker Engine >= 1.10.0 * Docker Compose >= 1.6.2**

1. `git clone git@github.com:phalcon/phalcon-compose.git`
2. `cp variables.env.example variables.env`
3. `docker-compose up -d`
4. 開啟網頁 localhost:80
5. 建立檔案 `./phalcon-compose/application/public/hello.php`
	- `<?php echo "world"; ?>`
6. 開啟網頁 localhost/hello.php