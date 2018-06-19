# synopsis

使用 remot3.it 這個工具，讓 raspi 在 relay server 上註冊，透過 socket 方式連接 

https://remot3it.zendesk.com/hc/en-us/articles/115006015367-Installing-the-remot3-it-weavedconnectd-daemon-on-your-Raspberry-Pi

# step
## install

1. `cat /etc/os-release`
2. `apt-get update`
3. `apt-get install weavedconnectd`

## Run weavedinstaller to configure remot3.it service attachments
1. `sudo weavedinstaller` 
2. 登入
3. 設定名稱
4. 設定完成後，會返回 services 的畫面，顯示目前安裝的 services，選擇 4 離開

## 驗證與測試
1. 登入 remot3.it 可看到裝置
2. 在網頁點選剛剛設定的裝置，點進去可看到裝置下的所有 services
3. 選擇 service 後，按下確認，就會出現連線方式，依照說明連線進入即可
