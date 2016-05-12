# swagger-editor

https://github.com/swagger-api/swagger-editor

## first

這是個 swagger.json 的線上編輯器。
可以下載在本地端操作與驗證。
如果你用線上的 editor 的話，驗證你的 api 可能會發生 CORS 的問題。
所以簡單的 combo 技，穩定安全又快速，就是下載一份吧。

放在 server，把 git hook 配置好自動化，放到 ```dist/spec-files/``` 下，就可線上直接開啟。

## 安裝

直接 clone 下來一份即可使用。      
若把系統玩壞的，可以配合 github 上的說明，重新 build 一份即可。

## 適合
- 通常 swagger-ui 比較適合：使用這些 api 的用戶群。
- swagger-editor 比較適合：開發這些 api 的 developer 進行驗證用，驗證畫面資訊正確與否，或者拿來練習 json，有錯會提示。