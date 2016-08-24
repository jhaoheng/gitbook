# MAMP 設定 DDNS

1. Dynamic DNS : 選擇想要的服務，註冊，並且登入
	- 我選擇 no-ip -> Manage hosts -> add a host -> 設定 redirect_name，選擇免費 DNS，直接按下確認即可(此必須設定在 MAMP-alias)
2. 回到 MAMP -> Dynamic DNS -> 登入該服務帳密 
	- 啟用上選擇『自動』
3. MAMP -> Hosts，選擇服務
	- General -> Dynamic DNS 選擇 **no-ip.com**
	- 下方的 alias name 輸入
		- 之前在 no-ip 上設定好的 ddns 