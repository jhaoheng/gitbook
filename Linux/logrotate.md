# env & 注意
- ubuntu
- 必須確認有 cron 服務
- 教學 : `https://linux.cn/article-8227-1.html`
- doc : `https://linux.die.net/man/8/logrotate`
- 必須確定已經有 log, 若無 log file, 系統會報錯 `error: stat of /root/xxxx.log failed: No such file or directory`

# 說明
- `apt-get install -y logrotate`
- 配置文件 : `/etc/logrotate.conf`
- 設定檔為至 : `/etc/logrotate.d/`
	- 若系統有安裝某些已有日誌的工具, ex:nginx, 會自動在 `/etc/logrotate.d/` 中, 建立相關的設定
- 檢查設定 `sudo logrotate /etc/logrotate.conf --debug`
- logrotate 歷史紀錄 `cat /var/lib/logrotate/status`
- 強迫 logrotate 立即執行 : `logrotate -f /etc/logrotate.conf`
	 - 透過 [logrotate 歷史紀錄] 可查看執行時間

# 主要設定
- compress             --> 壓縮日誌文件的所有非當前版本
- daily,weekly,monthly --> 按指定計劃輪換日誌文件
- delaycompress        --> 壓縮所有版本，除了當前和下一個最近的
- errors "emailid"     --> 給指定郵箱發送錯誤通知
- missingok            --> 如果日誌文件丟失，不要顯示錯誤
- notifempty           --> 如果日誌文件為空，則不輪換日誌文件
- olddir "dir"         --> 指定日誌文件的舊版本放在 「dir」 中
- postrotate           --> 引入一個在日誌被輪換後執行的腳本
- prerotate            --> 引入一個在日誌被輪換前執行的腳本
- endscript            --> 標記 prerotate 或 postrotate 腳本的結束
- rotate 'n'           --> 在輪換方案中包含日誌的 n 個版本
- sharedscripts        --> 對於整個日誌組只運行一次腳本
- size='logsize'       --> 在日誌大小大於 logsize（例如 100K，4M）時輪換

## ex : 
```
/tmp/sample_output.log {
	size 1k
	create 700 root root
	rotate 4
	compress
}
```

- size 1k - logrotate 僅在文件大小等於（或大於）此大小時運行。
- create - 輪換原始文件並創建具有指定權限、用戶和組的新文件。
- rotate - 限制日誌文件輪轉的數量。因此，這將只保留最近的 4 個輪轉的日誌文件。
- compress - 這將壓縮文件。

## ex : nginx
```
/var/log/nginx/*.log {
    daily
    missingok
    rotate 52
    compress
    delaycompress
    notifempty
    create 640 nginx adm
    sharedscripts
    postrotate
            if [ -f /var/run/nginx.pid ]; then
                    kill -USR1 `cat /var/run/nginx.pid`
            fi
    endscript
}
```