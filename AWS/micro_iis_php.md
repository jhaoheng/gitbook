## 環境
window server 2012 R2
IIS 8.5

## 安裝

https://technet.microsoft.com/zh-tw/library/hh994592.aspx

1. 安裝 IIS 
2. 安裝 web PI
	- 若發生無法從 ie 下載 Web PI，[解答](http://answers.microsoft.com/en-us/ie/forum/ie8-windows_other/error-message-your-current-security-settings-do/59cc236d-7baf-4552-92ff-b34b9a6942aa?auth=1)
	- Web PI 安裝 php 的過程中，要安裝 php 與 php in IIS Express
3. 設定 mapping 在 iis manager 中
4. 設定 default file name 新增 : index.php , Default.php
5. 設定 php 的過程中，要設定 php-cgi.exe
	- http://www.iis.net/configreference/system.webserver/fastcgi

6. 驗證 ```<?php php_info();?>```
