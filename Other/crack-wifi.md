https://diogomonica.com/sniffing-in-monitor-mode-with-airport/

## 環境
mac osx EI Capitan 10.11.3

## 透過 airport 進行掃描

- [關於 airport](http://osxdaily.com/2007/01/18/airport-the-little-known-command-line-wireless-utility/)

- 一般操作

	```
	cd /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/
	./airport -s
	```

- 簡化使用，將命令列放到 `/usr/local/bin`

	```
	sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
	```

### 開始監聽取得 cap

```
sudo ./airport en0 sniff  1 //電腦網卡為 en0 , 1 為 channel
```
執行後，無線網路圖示變更為監聽者

![img1](./~resource/crack-wifi-img1.png)

監聽時，可開啟另一個 cmd 執行  

```
cd /tmp/ ; open .
```
可發現在 tmp 下產生 *.cap 檔案，此檔案會隨著你監聽的時間，容量變大

ctrl+c 關閉後 :

```
Capturing 802.11 frames on en0.
^CSession saved to /tmp/airportSniffLm14Ij.cap.
```

掃描過程中，可點開 上方圖示監視者，可看到目前掃描的狀態，可先按下 alt 再點開  
抓不到 (0)handshakes，猜測估計是 airport 只能抓到 apple 產品的訊號

## 使用 scapy

### 說明
Scapy 除了可以偽裝別人的 MAC address 或 IP address來發送封包之外，也可以利用內建的 Sniffer 來截取別人的封包，窺探封包裡面的資料，例如某網站沒有用HTTPS加密當使用者輸入完密碼，送出後利用 Sniffer 就可以拿到該密碼。

- [Installing Scapy v2.x on mac](http://www.secdev.org/projects/scapy/doc/installation.html#installing-scapy-v2-x)
- 安裝版本 : scapy-2.3.1
- 需求
	- wget

```
$ unzip scapy-2.3.1.zip
$ cd scapy-2.3.1
$ sudo python setup.py install
```

## 使用 aircrack-ng

http://www.yyker.com/20131109457.html

- [教學](http://www.aircrack-ng.org/doku.php?id=faq#where_can_i_find_good_wordlists) : 內有字典檔
- 安裝：`brew install aircrack-ng`，也可用 macport

- 破解_1：`aircrack-ng -w <字典檔>.txt <分析>.cap`
	- 
- 破解_2：`aircrack-ng -1 -a 1 -b <target mac address> /tmp/*.cap`
	- '-1' : run only 1 try to crack key with PTW
	- '-a 1'(-a <mode>) : force attack mode (1/WEP, 2/WPA-PSK)
	- '-b' : target selection: access point's MAC

- [使用 ubuntu](http://shazikai.blogspot.tw/2015/01/aircrack-ng-wpawpa2-wifi.html)

## 關於字典

- 一般人喜歡用電話號碼、手機號碼、統編