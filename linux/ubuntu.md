## os version
```cat /proc/version```
>
Linux version 3.10.35 (root@build2) (gcc version 4.7.3 20130102 (prerelease) (crosstool-NG 1.18.0) ) #5644 SMP Fri Jan 22 13:38:47 CST 2016

```
cat /etc/*-release
```
> 
> PRETTY_NAME="Ubuntu 14.04.3 LTS"

### apt-get


## 時區校正

```
dpkg-reconfigure tzdata
```

## crontab 
可用

@reboot        Run once, at startup.
@yearly         Run once a year, “0 0 1 1 *".
@annually      (same as @yearly)
@monthly       Run once a month, “0 0 1 * *".
@weekly        Run once a week, “0 0 * * 0″.
@daily           Run once a day, “0 0 * * *".
@midnight      (same as @daily)
@hourly         Run once an hour, “0 * * * *".

若要執行指令，需確定權限



設定 cron 給開機執行
```
update-rc.d cron defaults 
```

### 修改 crontab 編輯器

查看支援哪些編輯器
```
update-alternatives --list editor
```

設定使用的編輯器
```
update-alternatives --config editor
```


## 20160211

查看 reboot 執行的程序
```
sudo apt-get install rcconf
```

## 20160209

Git
```
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get install git
```

## 20160206

vim
```
sudo apt-get install vim
```

## 2016004

[gitbook](https://github.com/GitbookIO/gitbook)
要開啟port