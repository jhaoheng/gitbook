- `brew install beanstalkd`
- beanstalk_console(php) : <https://github.com/ptrofimov/beanstalk_console>
	- 下載 archive 檔案，放入 mamp 中，路徑指到 public 即可
	- 進入後，新增 server
- beanstalkd-cli : <https://github.com/schickling/beanstalkd-cli>
	- `beanstalkd-cli put msg`
	- `beanstalkd-cli pop`
	
主要就是 beanstalkd 送入 queue，然後 php 從 beanstalkd 中取出 msg
這邊取出 msg 的部分 phalcon 可作掉

再送給 notification server 進行推播


1. beanstalkd_cli 手動送參數進去
2. while 不斷地接收任務
3. 將參數解析，送給 notification push provider server
4. delete task


# 測試

## 環境
1. A mac 電腦， `brew install beanstalkd`
2. B mac 電腦， 透過 phalcon 的 beanstalk 進行 連線操作

## flow

1. A 電腦查看目前網路下的 ip : 192.168.xx.xx
2. A 電腦執行 `beanstalkd -l {ip} -p 11300 -V`
3. B 電腦執行 beanstalkd 連線的動作

## get

透過 抓取 peekReady() 的 while，會一次把所有準備的 queue 一次抓出來
所以是否要透過 crontab 建立物件的持續檢查，每隔幾分鐘做一次????

# job 生命週期

- put job
	- 放入 job queue
	- 放入 db
- execute job
	- 執行 job
	- 更新 db
- db
	- id, jobId, jobBody, jobOptions, is_inQueue, createTime(utc), triggerTime(utc)