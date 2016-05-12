http://help.gitbook.com/platform/hooks.html

可在 server 直接 run 

也可將靜態檔案，放到 server 上  
但如此一來就不會執行，自動 reload 的功能

這邊用的 deploy 的方法是 webhook  
因為 repo 放在 gitlab 上  

直接用 gitlab 的 webhook 的方式，進行 deploy

## 放置位置
- 可以選擇放在自架 server
	- 我原先的做法:NAS/docker/centOS/
	- 設定一些安全性的設定，就可以變成私人的 book，如:vpn
	- 要自己設定 git hook or webhook
- 可放在 gitbook.com，該網站有提供 webhook。
- 因為最後產生的為靜態檔 html，所以也可放在 github 上。

## 使用 plugin

[search plugin](https://plugins.gitbook.com/browse?page=1)

- [gitbook-plugin-tree](https://github.com/Houfeng/gitbook-plugin-tree) : 側邊欄折疊
	- ```npm install gitbook-plugin-tree```
	- book.json 新增 ```{"plugin": "tree"}```

- [gitbook-plugin-todo](https://plugins.gitbook.com/plugin/todo)
	- ```npm install --save gitbook-plugin-todo```
	- book.json add 
		```
		{
		    "plugins": ["todo"]
		}
		```
		
- [Disqus plugin](https://plugins.gitbook.com/plugin/disqus)
	- 須先去 [Disqus](http://disqus.com/register) 註冊一個新討論頁面
	- 在 shortname 中填入，申請的名稱
		- ex: `shortname.disqus.com`，中的 `shortname`

ps:若不用 npm install 安裝，寫入 book.json 後，再使用 gitbook install，亦會一次安裝全部 


## webhook
synology/@docker/home/webhook/gitbook_web.php

## 討論
所以其實不應該用 gitbook serve 進行 serve 常駐調用  
還是應該安裝 apache or nginx  
進行靜態頁面 html 的生成

- php
- nginx