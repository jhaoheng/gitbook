## nodejs 推播

- 放置 nodejs 推播在雲端，開啟 port
- 憑證經由 bash 產生後
	- 上傳方法
		- 透過 git deploy 上傳到固定位置
		- 本機電腦將憑證拖曳到該 app，並選擇上傳，直接同步到該 node_push:port/project/ 的位置下
	- 會有 log : date
	- 自動變更憑證檔案名稱 
- 手機 app 透過 push 直接按下測試，直接將 token 與 bundle id 送到該雲端位置
- 雲端 node_push:port 接收到後
	- 比對 bundle id
	- 比對 token
	- 送出 push


## error

- 若能在 mobile / cloud 驗證，token 與 pem 是否為同一組，則可降低失敗率，並提示用戶該如何操作