1. 從 nodejs 抓到 restful api 
2. 輸出 json format
3. 輸入 參數, response 參數
4. 路徑為 
	- path : {url}/{user}/resource
	- header : 
		- Auth : {AES128}

若遇到要安裝 module, ex: request 負責 url callback 的處理

```
npm init --yes
npm install request --save
```

在 .js 中，放入 `require('request');` 即可