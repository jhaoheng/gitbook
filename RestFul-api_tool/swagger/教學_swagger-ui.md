# swagger-ui

[swagger-ui](https://github.com/swagger-api/swagger-ui)

## first
swagger-ui 可直接透過 swagger.json(definition)，進行解析。
無需 codegen，若要產生 definition 檔案，可用

- 第三方套件：swagger-php
- swagger-editor
- 其他官方工具

進行產生 json 檔案。
至於驗證，須滿足

- json 檔案正確
- DNS 可被外部讀取
- json 可被外部讀取，與檔案權限有關

## pre-required
若要重新 build，則需要，基本上直接使用 dist/ 內的檔案即可。

## build dist
dist 是 swagger-ui 產生的一個靜態檔，直接 git 裡面也有此檔案，若想重新 build 可執行以下流程。 

- ```cd swagger-ui/```
- ```npm install```
- ```gulp```
	- 安裝 [gulp](http://www.gulpjs.com.cn/docs/getting-started/)
- 執行完畢，就會產生一個新的 ```./dist/``` ，將此資料夾直接放在你網站的根目錄，browser 打開輸入網址即可，預設開啟首頁為 ```index.html```

## index.html 使用方法

- 關於各個參數，可參考 ```swagger-ui/README.md```
- 關於 url 參數
	- 必需填入 server side url
	- **若 url 未經過 swagger validation 驗證，則下方的驗證會出現紅色框的 error。**
- **關於 spec**
	- spec 只能填入 json 內容，不能直接使用檔案連結
- **關於 validatorUrl**
	- 預設的 validatorUrl 為 TRUE，可設定為 null。
	- **若驗證不通過會產生 error 的警訊。**
- 可自己設定多國語言
	- 可自行修改 ```lang/en.js``` 改為你要的語言，然後回到 index.html 中，將你的語言放入即可。	
## 測試

- 直接使用 swagger-ui 進行測試，需確定的 json tag 為：（以下的 spec [參考](http://swagger.io/specification/)）
	- host
	- basePath
	- schemes
	- path：api 路徑位置
- 系統會自動把 schemes/host/basePath/path 組合起來。
- swagger.json 無需放在 server side，只需確認 json 內容即可，並確認可被 swagger 解析。
**必須確定 swagger.json 的驗證是正確的，否則 api 測試會失敗**

## 支援

- 可先到 [swagger editor](http://editor.swagger.io/) 將 swagger.json 檔案抓下來。
- 在編輯 swagger definition 時，最好進行檢查驗證，或者透過 swagger editor 進行編輯，不然不熟的情況下，錯誤機率頗大。
- [swagger-editor git](https://github.com/swagger-api/swagger-editor/blob/master/docs/cors.md)
	- 為了確保不會發生 CORS，最好把 editor 抓下來，在同一個 server 上進行操作。

	
## 錯誤

- 若你的 url 錯誤，則會顯示：
	- **Can't read swagger JSON from http://DNS/swagger.json**
- 若你的 swagger.json 的 schema -> [Field Name][swagger] 錯誤。[spec](http://swagger.io/specification/)
	- **fetching resource list: http://DNS/swagger.json**

	