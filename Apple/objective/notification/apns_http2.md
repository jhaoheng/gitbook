## 心得

### 目前可用的測試，直接用 curl 指令，不走 php/apache

### windows 安裝 curl
http://www.confusedbycode.com/curl/

### server side test
目前測試到 server 安裝 ssl.crt & ssl.key，出現 error
```
HTTP/2 client preface string missing or corrupt. Hex dump for received bytes: 504f5354202f332f6465766963652f316136383639633934
```
研判是該 server curl 版本不高，透過 phpinfo() 查看，的確是如此。  
解決方法用 docker 升級，但可能發生，該 docker 的 ssl.crt / key 不相同，會產生根本機 mac 一樣的問題

api : `http://huder.link/test/apns_http2.php`  
phpinfo : `http://huder.link/test/phpinfo.php`

### mac side test
curl / php / openssl 版本均升級到合適版本  
得到錯誤訊息 `Unknown SSL protocol error in connection to api.push.apple.com:443`  
參考路徑：~idgate/php_push/

## 資源

[apple docs](https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/APNsProviderAPI.html#//apple_ref/doc/uid/TP40008194-CH101-SW1)

- [phshsharp 3.x 亦使用](https://github.com/Redth/PushSharp)
	- Finish HTTP/2 support

## http2

版本要求

- openssl 1.0.2e以上
- curl 7.46以上（+nghttp2）
- PHP 5.5.24以上（無法執行），php 5.6.18 確定可行（無法支援 curl 7.46 只支援到 7.41）

## 注意
- 若要用 php 含 curl 進行測試，環境必須要安裝 ssl 憑證，且支援 TLS 1.2 ，不然會無法解析 ssl，無法送給 APNs
- 若純用 curl（下方有測試），則不需 php 與 apache 的環境是否有安裝 ssl 憑證

## 範例

- http://qiita.com/itosho/items/2402df4de85b360d5bd9

## 執行 cmd

```
curl -d '{"aps":{"alert":"hi","sound":"default"}}' --cert <憑證>:<密碼> -H "apns-topic: <你的 bundle id>" --http2 https://api.development.push.apple.com/3/device/<你的 token>
```

- 若 dev.pem / pro token，則會回傳 ```{"reason":"BadDeviceToken"}```
- 若 pro.pem / dev token 一樣可以可寄送
- 若 bundle id 錯誤，則回傳 ```{"reason":"TopicDisallowed"}```
- 若密碼錯誤，```unable to set private key file: 'apns_pro.pem' type PEM```
- 若成功，則沒 reason

**詳細可參考[Table 6-6  Values for the reason key](https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Chapters/APNsProviderAPI.html#//apple_ref/doc/uid/TP40008194-CH101-SW1)**

測試

```
curl -d '{"aps":{"alert":"max","sound":"default"}}' --cert apns_pro.pem:test -H "apns-topic: com.idgatetest.testapp" --http2 https://api.development.push.apple.com/3/device/1a6869c947894a9df0a0974bf149edd4ea841fd24544ccc7d00ed7c928cb4ead
```

