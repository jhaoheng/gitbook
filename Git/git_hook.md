# hooks

https://git-scm.com/book/zh-tw/v1/Git-%E5%AE%A2%E8%A3%BD%E5%8C%96-Git-Hooks

## server side
- 即將部署的位置，可以是任意資料夾
	- ```cd deploy_folder```
- repository bare 位置，此為 git bare 的型態，為 git push 後存放的位置
	- ```mkdir repo;cd repo;mkdir site.git;cd site.git```
	- 進入 site.git
		
		```
		git init --bare
		cd hooks
		```
	- ```vim post-receive```
	- insert 
	
		```
		#!/bin/sh
		git --work-tree=/path/deploy_folder --git-dir=/path/repo/site.git checkout -f
		```
		
	- ```chmod +x post-receive```

## local

1. ```mkdir project;cd project;git init```
2. ```git remote add live ssh://user@mydomain.com/site.git```
3. ```echo "test" >> test.log```
4. ```git add .;git commit -m "add";git push live master```

### response like below:

>
>Counting objects: 3, done.  
Delta compression using up to 4 threads.  
Compressing objects: 100% (2/2), done.  
Writing objects: 100% (3/3), 295 bytes | 0 bytes/s, done.  
Total 3 (delta 0), reused 0 (delta 0)  
To /repo/site.git/  
   db1aa95..80145bb  master -> master  
  
  
### debug
if you work-tree path error, you will get an error like   
**repository '/error_path/repo/site.git/' not found**


## 注意
可以在 remote 的位置上，新增 "production" 的庫源  
直接 git push production master 即可  
會比較清楚與直接  
且在 hook 中，設定 echo date >> deploy.log 

```
[remote "production"]
    url = username@webserver:/path/to/htdocs/.git
```