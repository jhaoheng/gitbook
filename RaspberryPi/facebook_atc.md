## install & setting

1. 建立好 wifi ap
2. 安裝 ATC : `http://facebook.github.io/augmented-traffic-control/docs/install.html`
3. 安裝完畢 atc django-ui 後，在執行 atcd 前，必須先知道 wan & lan 的端口
	- 透過 `route` 查詢
	- 啟動 `sudo atcd --atcd-lan xxxx --atcd-wan xxxx`
4. 執行 python manage.py runserver 0.0.0.0:8000
5. 開啟瀏覽器，會看到成功畫面
	- 若你的 atcd server 執行失敗，會產生授權錯誤的推播通知

## use

1. 開啟瀏覽器並打開 atc_demo_ui 的管理介面
2. 主要設置的參數有：
	- 網絡帶寬（bandwidth）
	- 延遲（latency）
	- 丟包率（packet loss）
	- 錯包率（corrupted packets）
	- 亂序率（packets ordering）
3. 新增 new profile 與 shaping settings 後，可在 Profiles 中看到設定的參數值，選擇後再開啟最上方的 trun on 即可
	- Network Condition Profiles 參考 : https://github.com/tylertreat/Comcast#network-condition-profiles