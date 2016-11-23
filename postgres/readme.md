# q = 對 db 連線出現：no pg_hba.conf entry for host ...

連線資料庫失敗

1. 找到 pg_hba.conf : `vim /etc/postgresql/9.3/main/pg_hba.conf` 
2. restart db : `cd /etc/init.d/; postgresql restart`