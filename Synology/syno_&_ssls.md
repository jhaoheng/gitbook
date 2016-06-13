# syno & ssls

https://www.namecheap.com/support/knowledgebase/article.aspx/9423/0/apache-opensslmodssl

1. 進入 synology -> 憑證
2. 建立憑證 -> 建立憑證簽署請求(CSR)
3. 下載，取得server.csr , server.key
4. 進入my ssl 輸入 server.csr 內容
5. 會自動選取伺服器的架構 ex: apach+openssl
6. 確認信件
7. 下載 信件附件 ， 有四個檔案 ： 
	- AddTrustExtenalCARoot.crt
	- COMODORSAAddTrustCA.crt
	- COMODORSADomainValidationSecureServerCA.crt
	- <your domain name>.crt

8. 合併 *.crt -> bundle.crt
	- `cat COMODORSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt AddTrustExternalCARoot.crt >> bundle.crt`
9. 回到synology -> 憑證 
10. 依序輸入
	- 金鑰 : server.key
	- 憑證：huder_link.crt
	- 中繼：bundle.crt

11. 在 website 中，插入 security seal , copy snippet code 即可。