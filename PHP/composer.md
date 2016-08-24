# install / update

brew install composer
brew upgrade composer

# version

Composer version 1.2.0 2016-07-19 01:28:52

# 參考
- composer 使用 : http://getcomposer.ycnets.com/doc/01-basic-usage.md
- 套件管理 : https://packagist.org/

# how to use 

## 快速使用 

- 安裝 facebook : `composer require facebook/graph-sdk`

## 基本使用
- composer.json

	```
	{
	    "require": {
	        "facebook/graph-sdk": "^5.3"
	    }
	}
	```
	
- install depended : `php composer.phar install`

## file structure list

- composer.json
- composer.lock
- verder/
	- autoload.php
	- composer/
	- facebook/
		- graph-sdk/

ps : 慣例是放置第三方程式碼到一個名為 vendor 的目錄。

## about .gitignore
如果你正為你的專案使用 git，你可能想要添加 vendor 到你的 .gitignore 中。

# composer.lock 鎖定版本
在安裝依賴套件之後，Composer 會把安裝的確切版本列表寫入一個 composer.lock 檔案。 它鎖定專案為指定版本。
如果不存在 composer.lock 檔案，Composer 會從 composer.json 讀取依賴套件和版本，並在執行 update 或 install 之後建立鎖檔案。
這意味著，如果任何依賴套件有新版本，你不會自動取得更新。 要更新新的版本，使用 update 命令。 這會取回最新匹配版本（根據你的 composer.json 檔案） 並且也用新版本更新鎖檔案。

`php composer.phar update` or `composer update`

註： 如果 composer.lock 和 composer.json 不同步的話， Composer 在執行 install 命令時會顯示警告。

# auto loading

對於指定了自動載入資訊的函式庫，Composer 產生一個 vendor/autoload.php 檔案。你可以簡單地引入此檔案， 你會得到免費的自動載入。

`require_once __DIR__ . '/vendor/autoload.php';`

