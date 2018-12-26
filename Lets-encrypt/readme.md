服務商提供一個網域可以使用 100 個免費憑證，如果您有很多 subdomain 需求，還可以申請獨立一張 wildcard 憑證

# lets-encrypt
- 申請網站 : https://certbot.eff.org/

- 驗證如何執行?

- 所以新的服務
	- start 
		- 建立憑證, 建立 auto renew 的 crontab
	- stop : 停止所有的憑證, 並進行刪除
	- view : 檢視憑證

# certbot
- `certbot -h <topic>`

# Run with Docker
https://certbot.eff.org/docs/install.html#running-with-docker

# 如何 renew

1. 必須先停止 443 port 的使用, 所以要停止 nginx
2. 執行 `certbot renew`
3. 重新執行 nginx

# 如何 auto-renew
https://www.onepagezen.com/letsencrypt-auto-renew-certbot-apache/