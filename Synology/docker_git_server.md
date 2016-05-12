## 原理

1. 先使用 [docker_掛載儲存空間](./docker_掛載儲存空間.md) ，進行掛載
2. 在該資料夾下建立，git_repo/<name>.git
3. 在 ```.git``` 下執行 ```git init --bare```
4. 在自己的電腦下執行

	```
	git clone ssh://root@<dns>:<port>/volume1/<your_path>/<name>.git
	```