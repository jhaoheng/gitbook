
# raspberry install bonjour
> 以往安裝的 Raspberry Pi 都輸入了固定 IP 地址，在家使用沒有問題；但拿到別的地方用時，由於網域不同，造成無法連線。最好的方法是利用 DHCP 分派 IP 地址。但這又衍生另一問題，怎樣知道 Raspberry Pi 的地址呢？尤其是沒有接上顯示屏的情況。要解決以上問題，只要安裝 Bonjour 就可以。安裝方法如下：

1. sudo apt-get update
2. sudo apt-get upgrade
3. sudo apt-get install avahi-daemon

成功安裝後，便能以「ssh pi@raspberrypi.local」來遙距登入 Raspberry Pi。

- 安裝完畢後，可透過 `avahi-daemon -h` 進行功能查詢，基本上已經正在跑，可以用 `avahi-daemon` 可以知道服務正在執行 

# 使用 avahi-daemon 進行 bonjour 的服務註冊
> 目的是讓 client 可以透過 bonjour 的方式進行搜尋

1. 在 raspberry 中，`vi /etc/avahi/services/multiple.service`，編輯內容如下，意思就是建立 bonjour 的搜尋內容，若無定義，則找不到服務

```
<?xml version="1.0" standalone='no'?>
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
        <name replace-wildcards="yes">%h</name>
        <service>
                <type>_device-info._tcp</type>
                <port>0</port>
                <txt-record>model=RackMac</txt-record>
        </service>
        <service>
                <type>_ssh._tcp</type>
                <port>22</port>
        </service>
        <service>
                <type>_http._tcp</type>
                <port>80</port>
        </service>
</service-group>
```

- 完成後，請執行 `/etc/init.d/avahi-daemon restart` or `avahi-daemon -r`
- 基本上只要安裝好 avahi 後，就可以直接透過該預設的 host : raspberry.local 連到該機器，以上的設定，只是為了讓 bonjour client 在 lan 下，搜尋是否搜尋到服務的一個廣播
	- 應用實例 : 安裝後，透過 osx command : `dns-sd` 進行 bonjour 註冊服務的搜尋，若 raspberry 沒有設定 'multiple.service' 則找不到該機器
	- 問題，如果有兩個相同的 raspberry.local 那該如何判別？

# 在 osx 上，透過 dns-sd 進行搜尋 bonjour 的服務
- 執行 `dns-sd -B <type>`, type 可以是 `_http._tcp` or `_ssh._tcp`
```return
Browsing for _http._tcp
DATE: ---Sat 03 Feb 2018---
 4:12:37.611  ...STARTING...
Timestamp     A/R    Flags  if Domain               Service Type         Instance Name
 4:12:37.612  Add        2   5 local.               _http._tcp.          raspberrypi
```

- 找到裝置後，就可以透過  `raspberrypi.local` 進行連線 ... ，至於服務端的定義，如 80 port, 22 port, 就看設定檔如何設定

# 更新 host
> 更新「raspberrypi.local」這個名稱

1. 可以在 SSH 登入之後輸入「sudo nano /etc/hosts」。把 127.0.1.1 那行後方的「raspberrypi」改成想要的名字；
2. 儲存後輸入「sudo nano /etc/hostname」，同樣把「raspberrypi」改成想要的名字並儲存。
3. 最後輸入「sudo /etc/init.d/hostname.sh」把以上改動生效
4. 再以「sudo reboot」重新啟動便能完成。