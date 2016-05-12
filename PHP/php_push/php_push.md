## php_push

- 放置 php_push 於雲端
- 憑證透過 bash 產生後
	- 上傳方法
		1. git deploy 上傳到固定位置 or
		2. 透過 app 上傳同步
	- 建立以 bundle id 為名稱的 project，並紀錄 log(建立時間)
	- 自動變更憑證名稱
- 手機 app，選擇發送後，將 bundle id 與 token 一起送到 server
- server 接收後，將 bundle id 比對到對應的 project，建立 log(日期、推送內容)，進行 push


## error

- record log[date]

## Need feature
- 透過網頁，查看目前線上專案有哪些，意指 testing app 可設定哪些 bundle id 進行測試

- 網頁版選擇送出的 push 操作畫面
	- 選擇專案
	- 選擇推送內容