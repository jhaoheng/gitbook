# noobs & raspbian
- NOOBS 是一個多重開機系統，開機後，可選擇要安裝的作業系統
- raspbian 是一個作業系統，也可安裝 NOOBS 後，選擇安裝 raspbian

# install NOOBS

- new out of the box software 
- 協助操作環境 : mac osx
- 需要工具 :  
	- [SD Association's Formatting Tool](https://www.sdcard.org/downloads/formatter_4/)
	- Logitech mk240 無線鍵盤組
	- sd 卡

1. 下載 https://www.raspberrypi.org/downloads/noobs/
2. 透過工具進行 sd 卡的 format
	- 我原本透過 max osx 本身用的磁碟工具程式進行格式化，無論是 fat or exfat 放到 raspberry 的板子中，都無反應
3. 解壓縮後，將所有資料放到你的 sd 卡的根目錄，請勿夾帶 folder
4. 接上電源後，會看到紅色的燈，與閃爍的綠色燈，開啟你的螢幕，選擇安裝的作業系統即可
5. 預設的登入
	- 用戶 : pi
	- 密碼 : raspberry
	- 圖形用戶介面 : 輸入 startx


# 直接安裝 raspbian

1. 從官網上選擇 raspbian
2. 下載後，解壓縮，會得到一個 .img 的安裝檔
3. 下載 ETCHER : 此為一個輔助安裝程式
	- 開啟 Ether，會讓你選擇 .img 位置與 sdcard 的位置，執行安裝即可