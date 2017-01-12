## 目的

透過最原始的 cmd line 的指令，使用 netcat 達到 socket 的訊息交換

## question
1. 執行 nc -l -p {port}，顯示 `Usage: nc [IPADDR PORT]    Open a pipe to IP:PORT`
	- 代表 nc 版本不支援，請安裝此版本 http://netcat.sourceforge.net/

## 參數

-d 後台模式
-e prog 程序重定向，一旦連接，就執行 [危險!!]
-g gateway source-routing hop point[s], up to 8
-G num source-routing pointer: 4, 8, 12, ...
-h 幫助信息
-i secs 延時的間隔
-l 監聽模式，用於入站連接
-L 連接關閉後,仍然繼續監聽
-n 指定數字的IP地址，不能用hostname
-o file 記錄16進制的傳輸
-p port 本地端口號
-r 隨機本地及遠程端口
-s addr 本地源地址
-t 使用TELNET交互方式
-u UDP模式
-v 詳細輸出--用兩個-v可得到更詳細的內容
-w secs timeout的時間
-z 將輸入輸出關掉--用於掃瞄時

## 如何使用
在一般的 Linux 系統中，從 0 到 1023 這個範圍的連接埠（port）是需要有 root 權限才能使用的，而 1024 以上的連接埠則是可以讓一般的使用者使用，在使用 Netcat 時請注意這個權限問題。

- 檢查特定的 port 是否有開啟
	- `nc -v {ip} {port}`

- 傳送 UDP 封包，給 server
	- `echo -n "foo" | nc -u -w 1 192.168.1.1 9001`
- 本地端開始監控
	- `nc -l -p {port}`

## 參考文章

- http://flyfox.pixnet.net/blog/post/31434453-netcat
- https://blog.gtwang.org/linux/linux-utility-netcat-examples/