# 利用 GCM 發佈 ios notification

## 說明
就是統一透過 GCM 這個平台，統一可發送 android 與 ios

## 官方網站
https://developers.google.com/cloud-messaging/

## ios官方教學
主要是透過 pod 安裝，可選 Objc or Swift
https://developers.google.com/cloud-messaging/ios/start

### 若尚未申請 apns 憑證，流程請參考
https://developers.google.com/cloud-messaging/ios/certs

### 關於教學流程
在設定『GET A CONFIGURATION FILE』時，最後會取得『伺服器 api 金鑰』，若忘記可至 Google Developers Console 中的『探索其他服務』->『API 管理員』->『憑證』
這可看到建立的『server key』。

### 官方 sdk 範例使用
- 下載好後，請把『GoogleServices-Info.plist』丟到 workspace 中，並讓三個 target 都可使用。
- 設定好 bundle id。
- 先執行 GCM EXAMPLE，取得『Registration Token』。
- 執行 GCM SERVER DEMO，輸入上面所講的『server key』與『Registration Token』即可。

