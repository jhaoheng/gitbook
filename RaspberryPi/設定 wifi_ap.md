# 全部做成一個 bash 進行切換

## initial check
1. 檢查網路是否支援 AP : `iw list`，須找到支援 AP 的選項
2. 檢察網路 : `ifconfig -a`，會看到
	- eth0 : 在我的 pi3 下顯示的是 enxb87ebbb66cf，在 iptables 的 package transfer 將 eth0 設定成此值
	- lo
	- wlan0
3. 接上 乙太網路線，先測試 raspberry pi 上的網路是否正常，透過 `route` 指令檢查 default 的 gateway，可得知 Iface 的名稱，也就是 eth0
4. 整個目標就是透過 iptable 的方式，交換 wifi 與乙太網路的資訊

## 設定 wifi 的資訊
- 目的 : 接收用戶端連線，設定 raspberry wifi gateway 的位置

1. 編輯 DHCP Client 設定資訊 : `vim /etc/dhcpcd.conf`
2. 在最下方，新增
	1. `interface  wlan0`
	2. `static ip_address=10.0.7.1/24` : 指定 wlan0 的 ip 位置
		

## 啟用 NAT
- 目的 : 透過 iptable 的設定，交換 wifi ap(wlan0) 與 eth0 的網路資訊

1. 開啟 ipv4 路由轉發功能，檔案位置 `/etc/sysctl.conf`
	- 查詢 : `cat /etc/sysctl.conf | grep ip_forward`
	- 變更設定 : 至 `/etc/sysctl.conf`，找到 `net.ipv4.ip_forward` 並設定為 1
		- 或透過指令變更 : `sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf`
2. 更新 iptable，將內部的 wlan0 封包轉給 eth0，詳細原理可參考 : `http://web.mit.edu/rhel-doc/4/RH-DOCS/rhel-sg-zh_tw-4/s1-firewall-ipt-fwd.html`
	1. `sudo iptables -F`
	2. `sudo iptables -F -t nat`
	3. `sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE`
	4. `sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT`
	5. `sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT`
3. 儲存設定，讓每次開機都自動設定
	1. `vim /etc/rc.local`
	2. 在 `exit 0` 之前，加入`sudo iptables-save > /etc/network/iptables.ipv4.nat`
4. 查看 iptable
		- `sudo iptables -t nat -S`
		- `sudo iptables -S`
		- `sudo iptables -L`

## 架設 DHCP Server
1. `sudo apt-get -y install dnsmasq`
2. `sudo vim /etc/dnsmasq.conf`，在最下方編輯
```
interface=wlan0
dhcp-range=10.0.7.101,10.0.7.200,255.255.255.0,12h
```
3. 重新啟動 dnsmasq : `sudo systemctl restart dnsmasq && sudo systemctl enable dnsmasq`

## 設定 hostapd

1. `sudo apt-get install hostapd -y`
2. `cp /usr/share/doc/hostapd/examples/hostapd.conf.gz /etc/hostapd/`
3. `gunzip /usr/share/doc/hostapd/examples/hostapd.conf.gz`
4. 編輯 hostapd.conf
	1. `interface=wlan0`
	2. `driver=nl80211`
	3. `ssid=RPI-AP`
	4. `hw_mode=g`
	5. `channel=11`
	6. `macaddr_acl=0`
	7. `auth_algs=1`
	8. `ignore_broadcast_ssid=0`
	9. `wpa=2`
	10. `wpa_passphrase=12345678` : 設定無線網路密碼
	11. `wpa_key_mgmt=WPA-PSK`
	13. `rsn_pairwise=CCMP`
5. 測試 : `sudo hostapd -dd /etc/hostapd/hostapd.conf`
	- 測試時，可以透過其他裝置，並連接上 wifi ap
	- 如果連接得上，但沒有辦法看網頁，為 iptables 設定錯誤，請檢查你的 iptables : `iptables -L`
6. 指定 hostapd daemon 的位置 : `sudo sed -i 's/#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/g' /etc/default/hostapd`

## 重新開機讓所有的設定值都生效
- `sudo systemctl enable hostapd && sudo reboot`

## troubleshooting

1. 找不到 ssid
	- 請重新啟動 hostapd
2. 連上 ssid，卻無法連到外部網路
	- 請檢查 iptables

## 檢查錯誤訊息
- `/var/log/syslog`

## 如何關閉 wifi ap
- 停掉 hostapd 服務即可 : `sudo systemctl hostapd stop`
