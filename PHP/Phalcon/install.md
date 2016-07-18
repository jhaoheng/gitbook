# install phalcon

1. [官方](https://phalconphp.com/en/download)
2. github : https://github.com/phalcon/cphalcon
3. install from github
	- `git clone`
	- `cd cphalcon/build`
	- `sudo ./install`
4. 遇到問題，參考 troubleshoot

## check 

1. `phpinfo();`

2. cmd

	```
	環境
	- `php -m | grep -i phalcon`
		- if output `phalcon` mean it is ok to use phalcon cmd
	- `apachectl -v`
		- output : `apache/2.4.16`
	- `php -v`
		- output : `php 5.6.23`
	- `mysql --version`
		- output : `mysql ver 14.14`
	```

## troubleshoot

1. 若 gcc 編譯失敗，`free -g`，查看 memory or swap 是否有 1g 可供 compile
	- 1g memory `https://github.com/phalcon/cphalcon/issues/10478`
2. 因為目前僅支援 5.4/5.5/5.6 版本，故如果用 7.x 版本編譯時，會產生名稱錯誤
3. 設定 `extension=phalcon.so`，出現 `PHP Warning:  Module 'phalcon' already loaded in Unknown on line 0`
	- [info](http://www.somacon.com/p520.php)
	- 在 php.ini 中，將 `extension=phalcon.so` 前面加 `;` -> `;extension=phalcon.so`
	- 執行 `php -m | grep -i phalcon`，正常
# 安裝 Phalcon develop-tool

- [介紹](https://docs.phalconphp.com/zh/latest/reference/tools.html)
	- 總之就是透過指令可以快速建立模組，連大小寫都處理好，另外還會結合資料庫建立 mode : getter / setter
- [install](https://github.com/phalcon/phalcon-devtools)
	- installation via Git
	- `sudo ln -s ~/path/phalcon.php /usr/local/bin/phalcon` mac 要放在 `/usr/local/bin` 下
- 執行 `phalcon`
	
	```
	Phalcon DevTools (2.0.13)

	Help:
		Lists the commands available in Phalcon devtools
	
	Available commands:
		commands         (alias of: list, enumerate)
		controller       (alias of: create-controller)
		module           (alias of: create-module)
		model            (alias of: create-model)
		all-models       (alias of: create-all-models)
		project          (alias of: create-project)
		scaffold         (alias of: create-scaffold)
		migration        (alias of: create-migration)
		webtools         (alias of: create-webtools)
	```
- 查看語法，直接執行 `phalcon [command]` 即可
	- `phalcon controller`
	- `phalcon webtools`	
- 啟用 WebTools
	- 在影片中，可以用 browser 的方式，進行設定，在網頁資料夾下，`phalcon webtools --action=enable`
		- 有新舊版本的問題，查看 github readme	
- 快速建立一個基本的 project : `phalcon create-project store`
	- 檢視網頁 : `localhost:[yourport]/store`