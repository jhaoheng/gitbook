## 透過 ca.key -> ca.crt
`openssl req -newkey rsa:2048 -x509 -nodes -sha512 -days 365 -extensions v3_ca -keyout ca.key -out ca.crt`
	- 此時輸入的 commonName 可為任意參數
	- 檢視憑證 : `openssl x509 -nameopt multiline -subject -noout -in ca.crt`

## 產生 server.crt / server.key
1. 產生 key : `openssl genrsa -out server.key 2048`
2. 產生 csr : `openssl req -new -sha512 -key server.key -out server.csr`
3. 產生 crt : `openssl x509 -req -sha512 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -CAserial ca.srl -out server.crt -days 365 -extensions JPMextensions`
	- commonName 在 localhost 時請填寫 localhost，若非 localhost 請填寫該 dns / ip
	- 注意: ca.crt 與 server.crt 的 commonName 不可相同
	- 檢視憑證 : `openssl x509 -nameopt multiline -subject -noout -in server.crt`

## 驗證 ca.crt 與 server.crt 關係
- `openssl verify -CAfile ca.crt server.crt`
	- output ssl.crt: OK