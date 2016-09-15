- `brew install beanstalkd`
- beanstalk_console(php) : <https://github.com/ptrofimov/beanstalk_console>
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