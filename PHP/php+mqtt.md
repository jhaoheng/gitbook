# php 透過 mqtt 進行發送與監聽
## install 

1. env : mac osx, php 7.0.8
2. 確定已安裝 mosquitto 在 mac 中 : brew install mosquitto
	- 取得 path : /usr/local/Cellar/mosquitto/1.4.9/lib/libmosquitto
3. 下載 github : https://github.com/mgdm/Mosquitto-PHP
4. 產生 mosquitto.so
	1. `cd Mosquitto-PHP`
	2. `phpize`
	3. `./configure --with-mosquitto=/usr/local/Cellar/mosquitto/1.4.9/lib/libmosquitto` 
	4. make
	5. sudo make install
	6. 得到 mosquitto.so 安裝的位置
5. 開啟 php.ini，設定 extension=mosquitto.so 與驗證
	- MAMP，請用套件管理 php.ini
		- 用 `phpinfo();`
	- 手動
		1. `php --ini`
		2. `cat {path}/php.ini | grep extension_dir`
		3. 將 mosquitto.so 放入此路徑
		4. 在 php.ini 中設定 extension=mosquitto.so
		5. 驗證 `php -i | grep mosquitto`

## 測試

- https://github.com/mqtt/mqtt.github.io/wiki/mosquitto-php

## 問題

1. 訂閱問題
	0. 若針對所有的 topic 進行訂閱，則開兩台 instance，就會收到兩次，無法做 loading balance....所以還是分段訂閱會比較清楚
	1. 當有新的必須訂閱的事件進來...就產生一個新的監聽 client(php sub.php topic)，訂閱的 topic 寫到 json 中。(or mongodb)
	2. 若取消該訂閱，則從 json 中移除該 topic
	3. 判斷 process 的狀態，bash file + crontab，定時檢查掛載上去的 sub topic process 與 json file 是否一致
2. 用 php or cmd:mosquitto?
	- 優點在 今天 sub 進來，直接處理，不用在 bash 這邊取得監聽內容後，丟給 php 處理