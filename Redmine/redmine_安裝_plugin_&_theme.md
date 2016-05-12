# redmine 安裝 plugin & theme

# plugin
## 環境
- bitnami package
- redmine 3.2 stable

## 路徑
```
~/apps/redmine/htdocs/plugins
```

## 注意
- 有些 github 下載的 package，還有一層 plugin/ 的 folder，要將該套件移到 plugin/ 的目錄下
- 要注意 error ，要將 production.log 權限改掉

  > Rails Error: Unable to access log file. 
  Please ensure that /opt/bitnami/apps/redmine/htdocs/log/production.log exists and is writable 
  (ie, make it writable for user and group: chmod 0664 /opt/bitnami/apps/redmine/htdocs/log/production.log). 
  The log level has been raised to WARN and the output directed to STDERR until the problem is fixed.
  


## 使用外掛

- [移除外掛的方法](http://www.redmine.org/projects/redmine/wiki/Plugins)
	1. ```rake redmine:plugins:migrate NAME=plugin_name VERSION=0 RAILS_ENV=production```
	2. 必須將該檔案刪除原本的 pulgin/ 位置
	3. 重新啟動伺服器

1. [Project Table](http://www.redmine.org/plugins/projects_table)  

	```
	git clone git://github.com/denispeplin/redmine-projects-table.git plugins/projects_table 
	brake redmine:plugins:migrate RAILS_ENV=production 
	sudo /opt/bitnami/ctlscript.sh restart apache
	```
	
2. [Redmine Lightbox2](https://github.com/paginagmbh/redmine_lightbox2)  
   
   ```
	git clone https://github.com/paginagmbh/redmine_lightbox2.git
	rake redmine:plugins:migrate RAILS_ENV=production
	sudo /opt/bitnami/ctlscript.sh restart apache
	```
3. [Attach image from clipboard](http://www.redmine.org/plugins/clipboard_image_paste)

   ```
	git clone git://github.com/peclik/clipboard_image_paste.git plugins/clipboard_image_paste
	rake redmine:plugins:migrate RAILS_ENV=production  
	sudo /opt/bitnami/ctlscript.sh restart apache
	```

4. [redmine_checklists](http://www.redminecrm.com/projects/checklist/pages/1)  
	因為這個套件沒有提供 git 故下載放在本機後，```scp``` 到遠端，我用的是 aws，要注意，在 ec2-instance 中， unzip 指令似乎不可行，所以我在本機端解壓縮後，用 tar 壓了一次，再用 scp 上傳
	
	```
	rake redmine:plugins:migrate RAILS_ENV=production
	sudo /opt/bitnami/ctlscript.sh restart apache
	```

5. [sidebar_hide](https://github.com/bdemirkir/sidebar_hide)
	
	```
	git clone https://github.com/bdemirkir/sidebar_hide.git
	rake redmine:plugins:migrate RAILS_ENV=production
	sudo /opt/bitnami/ctlscript.sh restart apache  
	```
6. [redmine-slack](https://github.com/sciyoshi/redmine-slack.git)  

	```
	$ git clone https://github.com/sciyoshi/redmine-slack.git redmine_slack
	$ rake redmine:plugins:migrate RAILS_ENV=production
	# 重啟 redmine
	```
	『error truble shooting』  
	發生 missing httpclient  
	解決方法
	
	```
	cd /opt/bitnami/apps/redmine/htdocs
	sudo aptitude install libhttpclient-ruby
	bundle install --no-deployment
	sudo /opt/bitnami/ctlscript.sh restart apache
	```
	使用方法:  
	1. 填入 Incoming WebHook integration URL  
		- 設定方法，進入 [slack app](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks) 申請
	2. Channel 名稱(要加入 # 字號，#redmine)
	

# theme

## source
```
git clone https://bitbucket.org/dkuk/redmine_alex_skin.git
```

## path
```
~/apps/redmine/htdocs/public/themes
```

## 寫一個 bash 檔案，自動安裝在某路徑上

# email setting
設定 google 時，請去
[google 我的帳號/登入和安全性](https://myaccount.google.com/security?utm_source=OGB)  
中，將最下面的  

- [允許安全性較低的應用程式] 設定處於啟用狀態

```
production:
email_delivery:
    delivery_method: :smtp
    smtp_settings:
      enable_starttls_auto: true
      address: "smtp.gmail.com"
      port: 587
      domain: "smtp.gmail.com"
      authentication: :login
      user_name: "max@id-gate.com"
      password: "password"
```

