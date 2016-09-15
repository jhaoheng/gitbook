brew install postgres

brew info postgres

啟動
`pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`

停止
`pg_ctl -D /usr/local/var/postgres stop -s -m fast`


## 其他指令
可到 /usr/local/Celler 中 postgres/bin 查看 

.createuser 等