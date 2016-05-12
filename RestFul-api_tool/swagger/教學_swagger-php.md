# [swagger] zircote/swagger-php

[swagger-php](https://packagist.org/packages/zircote/swagger-php)
**請搭配服用**

## first
- 此為安裝 zircote/swagger-php 到 composer 中。
- 使用 swagger 時，則會依據 zircote/swagger-php 提供的解析方式，進行解析你 php 中的註解，並產生 swagger.json。
- 可直接針對一個資料夾底下所有的 php 進行解析，若你是用 codeignoter 也行。

## 好處是

- 可以透過 phpdoc 建立註解的好習慣，同時可以直接產生 swagger 類型的 RESTful api。
- 進階用法可以透過 git + git flow + githook，當妳 merge 到 master/release 中，就直接產生一組 json，直接搭配測試。

## pre-required

- composer
- swagger
	- 可至 ~/.composer/vendor/bin 中，查看是否已安裝 **swagger**
- git

## build & test

1. ``` git clone ```
2. ```cd swagger-php; compuser update```
3. 若你把 compuser 安裝在 bin 下， ``` composer global require zircote/swagger-php ```
4. 做到這邊已經安裝完畢
	- 可以刪除 swagger-php，但其中有許多 [說明.md] 檔案，不懂可看。
	- 在 ``` ~/.composer/vendor/ ``` 中，可發現 zircote/
5. 觀看說明 ~/.composer/vendor/bin/swagger --help
6. 測試
	- ``` cd /swagger-php/Examples ```
	- ``` ~/.composer/vendor/bin/swagger petstore.swagger.io --output ./swagger.json ```
	- 你會看到以下 log

		``` 
		Swagger-PHP 2.0.1
		-----------------
		    get /pet/findByTags
		    get /pet/findByStatus
		    get /pet/{petId}
		   post /pet/{petId}
		 delete /pet/{petId}
		    put /pet
		   post /pet
		   post /pet/{petId}/uploadImage
		    get /store/inventory
		   post /store/order
		    get /store/order/{orderId}
		 delete /store/order/{orderId}
		   post /user
		   post /user/createWithArray
		   post /user/createWithList
		    get /user/login
		    get /user/logout
		    get /user/{username}
		    put /user/{username}
		 delete /user/{username}
		------------------------
		20 operations documented
		------------------------
		```
		
7. 將 swagger.json 丟到你的配置中即可。