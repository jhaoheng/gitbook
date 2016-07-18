# 使用 Phalcon-devtools

## 版本

- 執行 `phalcon` 確認版本 : `Phalcon DevTools (2.0.13)`

## 建立專案 

- 快速建立一個基本的 project : `phalcon create-project store`
	- 檢視網頁 : `localhost:[yourport]/store`
- 在非 phalcon direction，只能使用 `phalcon project` 的指令建立 project 的結構
- 在該 project 下，可以使用其他的指令
	- `phalcon webtools enable`
		- 啟用 web 介面的 phalcon 編輯器
		- `http://[localhost]/[project_name]/webtools.php`
	
## 資料庫設定

- PATH : `store/app/config` 中的 config.php
	- 若在 create 專案時，有特別指定使用 `.ini` 為其擴展名，才會特別使用。(`--use-config-ini`)
	- 使用 `phalcon project --help` 查詢指令

## models

- 建立模型，目的在於制式化處理某些事情，或者驗證，如每次呼叫模型的某個 method，都希望得到『用戶名稱』
- 建立 model 前，須先把 db 與 schema 建立完成
	- 建立完成後，才可以建立 `phalcon model [model_name]`
		- 如果沒有該 table name : [Error: Table "people" does not exist.]
	- Troubleshoot : `ERROR: SQLSTATE[HY000] [2002] No such file or directory`
		- `php --ini`
		- `vim php.ini`
		- 搜尋 `mysql.default_socket`
			- 因我使用 mamp 所以填入 : `/Applications/MAMP/tmp/mysql/mysql.sock`
			- 查詢 socket
				- `mysql -u root -p`
				- `show variables like '%socket%';` 填入該路徑即可
- 在專案的根目錄下 : `phalcon model`，有基本的 Usage

## Scaffold a CRUD

- Phalcon-devtool 可以快速生成整套的 CRUD 框架 : controller / model / view
	- Notice : 注意 model 產生時，必須要有對應的 table-name
- `phalcon scaffold --table-name products` 會產生
	- app/controllers/ProductsController.php
	- app/models/Products.php
	- app/views/layout/products.phtml
	- app/views/products/new.phtml
	- app/views/products/edit.phtml
	- app/views/products/search.phtml
- 在輸入測試資料與其他應用時，可以再進行修改

	
## 啟用 WebTools

- 透過 web 的介面，進行操作 model / controller
- 路徑 : `http://[localhost:port]/store/webtools.php`
- 啟用 : `phalcon webtools --action=enable`