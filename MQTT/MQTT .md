1. 先解決 8883 的問題
2. topic cached 的問題，不能做在 client，要放在 server 上，是否訂閱過

## MQTT 
- 3.1
- [MQTT-Client framework]
	- http://www.hivemq.com/blog/mqtt-client-library-encyclopedia-mqtt-client-framework
	- https://github.com/ckrey/MQTT-Client-Framework
		- https://github.com/ckrey/MQTTInspector
		- https://github.com/ckrey/MQTTChat

### app 作法
1. 建立 ios app 支援 mqtt 
2. 確定在 server publish 後，手機 app 會被喚醒(only apns/gcm)
	- app 透過 mqtt 也可以直接控制 device

### php 作法 / client / server(broker)
1. 建立 device call mqtt server
2. 建立 server 發送給 mobile 這端的訊號
3. 基本上 1,2 是同一套，但必須要綁 auth 的認證

#### broker
MQTT client 的對口為 MQTT broker，位於所有訊息的中心，一個 borker 可以處理上千個同時連線數（MQTT client）
- 負責接收所有訊息
- 過濾
- 決定此 topic 應該傳給誰
- broker 也會保留住用戶端訊息的錯失
- 針對身份驗證與授權
	- 可與後端伺服器進行整合與授權
	- 因 broker 是完整曝露在網路上，故與後方整合是很有必要性，且 broker 必須處理大量的用戶訊息傳遞，故須注意安全性

broker 就像是一個 central hub，必須具備

- highly scalable
- integratable into backend sys
- easy to monitor
- failure-resistant 



## erlang study
http://erlang.org/erldoc

## 心得
1. 一旦 MQTT client 連線後，儘管停止連線，一旦 broker 進行通知，一樣會接收到訊息
	- 應該不是說停止連線，還在持續連線的過程中，只是 app 寫錯，但蠻弔詭的是，把 app 縮到背景，再打開後，是否要重新連線????
		- yes，當 app 關掉重新打開後，就會重新認證
2. 中文訊息可通

## Q
1. app 包出去的是 fremework 還是整包 code
2. server 需要出 api framework or 不需要出
3. 因為是直接 conn 到手機
4. 如果分開設計 MQTT 與 auth，但因為 device token 要進行驗證
	- auth
	- MQTT

	
## MQTT 實做測試
[Raspberry Pi安裝MQTT之應用 -- Android訊息推播](http://cheng-min-i-taiwan.blogspot.tw/2015/03/raspberry-pimqtt-android.html)

```
mosquitto has been installed with a default configuration file.
You can make changes to the configuration by editing:
    /usr/local/etc/mosquitto/mosquitto.conf

To have launchd start mosquitto at login:
  ln -sfv /usr/local/opt/mosquitto/*.plist ~/Library/LaunchAgents
Then to load mosquitto now:
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mosquitto.plist
Or, if you don't want/need launchctl, you can just run:
  mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf
==> Summary
🍺  /usr/local/Cellar/mosquitto/1.4.8: 32 files, 616.1K
```

## mac 測試

- <http://mosquitto.org/download/> : mosquitto-1.4.8
	- mac osx `brew install mosquitto`

## 關於 ios mqtt notification

必須符合在背景呼叫，才能使用 mqtt 在背景喚醒的資格
https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html#//apple_ref/doc/uid/TP40007072-CH4-SW4

### 確認 android 在關掉 app 的情況下，無法使用 mqtt 訂閱訊息，但訊息會儲存在 mqtt_s

## MQTT 淺談

http://blog.maxkit.com.tw/2014/01/mqtt.html


MQTT(二)Message Type and Flows
http://blog.maxkit.com.tw/2014/02/mqttmessage-type-and-flows.html

## apns & mqtt

https://segmentfault.com/q/1010000004402881
iOS在后台留给程序获取网络请求的时间非常短，而且你还想在未启动app时获取推送，只能通过APNS，极光推送的原理也是基于APNS的！

### mqtt 與 apns 的交互應用
http://www.it610.com/article/3557409.htm

## 若用 mqtt 必須確保訊息不被遺失
當設備不在網路上時，若 server push 過去，則有可能訊息遺失，並且不會重複推送
若是走 gcm/apns 則訊息遺失的比例會降低些


## 流程

1. 註冊成功
2. 開始配對
3. device 配對完成
4. device 發送配對完成訊息給 mobile（local notification）
5. mobile 記錄下 topic

所以手機是否要一個 list 已配對的訊息出來，選擇進行訂閱的服務


## mosquitto

### install 
http://mosquitto.org/download/
- centos

### test

> must mosquitto & mosquitto-clients

1. run server : (系統常駐)
	- `$ sudo yum install mosquitto`
	- `$ sudo yum install mosquitto-clients`
	
2. sub
	- `$ mosquitto_sub -h [server_address] -t /[topic]`
	- topic 包含 '/'
	- `mosquitto_sub -h 52.197.79.230 -t /test/# -i client_id_2 -u orbweb@orbweb.com -P orbweb@orbweb.com`
	- mosquitto_sub -h mqtt.orbwebsys.com -t /orbweb/# -i client_id_2 -u max.hu@orbweb.com -P a12345
	- mosquitto_sub -h stg-mqtt.orbwebsys.com -t /orbweb/# -i client_id_2 -u harold.chen@orbweb.com -P a12345
	- mosquitto_sub -h localhost -t /orbweb/# -i client_id_2 -u max.hu@orbweb.com -P a123456
	- mosquitto_sub -h localhost -t /orbweb/# -i client_id_2 -u 8cd478f1@gmail.com -P a123456
	- mosquitto_sub -h mqtt.orbwebsys.com -t /zavio/ipcam/motiondetector/XRHIU1Z76KFMWXPDWQFM -i client_id_2 -u max.hu@orbweb.com -P a12345
3. pub
	- `$ mosquitto_pub -h [server_address] -t /[topic] -m “[message]”`
	- `mosquitto_pub -h dev-mqtt2.orbwebsys.com -t /test/topic -m "mac" -u orbweb@orbweb.com -P orbweb@orbweb.com -i client_id_1`
	- mosquitto_pub -h mqtt.orbwebsys.com -t /orbweb/ipcam/motiondetector -m "mac" -u max.hu@orbweb.com -P a12345 -i max
	- mosquitto_pub -h mqtt.orbwebsys.com -t /zavio/ipcam/motiondetector/XRHIU1Z76KFMWXPDWQFM/location -m "mac" -u max.hu@orbweb.com -P a12345 -i max


### 安裝 php 套件
http://wingsquare.com/blog/developing-php-client-for-mqtt-using-mosquitto-php-library/

mosquitto_pub -h stg-mqtt.orbwebsys.com -t /orbweb/ipcam/motiondetector/JPQQBX8Q9KO356CNQWMU -m "max_test" -u max.hu@orbweb.com -P a12345 -i max
## sub 格式
`topic/topic/+/#`

1. 不能 `#` or `+` 放第一個
2. `test/` 與 `test` 不相同，同樣的用 `test/#` 與 `test` 也不同，但 `test/#` 與 `test/` 相同

mosquitto_sub -h localhost -t /orbweb/# -i client_id_2 -u max.hu@orbweb.com -P a12345
mosquitto_sub -h localhost -t /orbweb/# -i ccfc821be2c7b2a39133f7f7cbfa8106fcd42def48faf1e3c7 -u 00:1B:FE:0D:44:21 -P hcpwdtst

## ssl

- mosquitto_sub -h 127.0.0.1 -p 8883 -t /orbweb -i demo2 -u max.hu@orbweb.com -P a12345 --cafile ca.crt 
- mosquitto_sub -h 127.0.0.1 -p 8883 -t /orbweb -i demo2 -u max.hu@orbweb.com -P a12345 --cert server.crt --key server.key

