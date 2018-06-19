# Usage
> http://rockingdlabs.dunmire.org/exercises-experiments/ssl-client-certs-to-secure-mqtt

```
#   ./generate-CA.sh                // creates ca.crt and server.{key,crt}
#   ./generate-CA.sh hostname       // creates hostname.{key,crt}, same as server.{key,crt}
#   ./generate-CA.sh client email   // creates email.{key,crt}
```

- 產生 ca 憑證(根憑證)
    - 預設執行任何一個指令，若無 ca 資訊，預設會自動產生 : ca.crt / ca.key (public key) / ca.srl
- ca 授權, 簽署 server 憑證
    - 使用 : `./generate-CA.sh {hostname}`
    - 產生 : {hostname}.csr / {hostname}.crt / {hostname}.key (private key)
- ca 授權, 簽署 client 憑證
    - 使用 : `./generate-CA.sh client {email}`
    - 產生 : {email}.csr / {email}.crt / {email}.key (private key)

# 其他
## 名詞
- ca
    - key : 用來產生 ca.crt
    - crt : 根憑證, 可用來簽發其他憑證授權
    - srl : ca 序號文件, 用 ca.srl & ca.crt 來簽署其他憑證
- 憑證授權簽署憑證 (server / client)
    - key : 用來產生 {簽署憑證}.crt
    - csr (certificate signing request) : 一份資訊檔, 透過 {簽署憑證}.key 產生並填入相關資訊
    - crt : 透過 {簽署憑證}.csr 中的資訊, 產生 {簽署憑證}.crt. 再用 ca (crt & srl) 授權簽署 {簽署憑證}.crt

## question
> 為何會需要 server / client 各簽一份?
> ans : 若需要 server / client 互相驗證為前提, 會需要兩張被`根憑證`簽署過的憑證

## 正式流程探討
1. 產生 key & csr 送交給憑證單位
2. 憑證單位驗證後, 回傳 crt

## 自簽流程探討
1. 產生 ca 相關資訊 (srl / crt / key)
2. 建立 ca 授權簽署憑證 (csr / crt / key)

# 驗證
## 驗證憑證 (.crt)
`openssl x509 -in {xxx}.crt -nameopt multiline -subject -noout`

## 確認 CSR 檔案正確與否
`openssl req -text -noout -verify -in myCSR.csr` -> 第一行出現 verify OK 字樣

## 驗證簽出的憑證與 ca 根憑證是否相同
`openssl verify -CAfile {rootCA}.crt {server}.crt {client}.crt`




