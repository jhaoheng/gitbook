# swagger-codegen

## first
swagger-codegen 為一個模板產生器，主要會透過 server template 產生 client template。		
而產生 client 的過程中，一樣需要 swagger definition 定義好的 swagger.json 進行編譯。			

而若單純使用 swagger-ui，則只需要建立好你的 definition 後，產生 swagger.json 即可使用。codegen，主要可透過多個不同的語言進行 client 的產生，方便開發者使用。若你使用的語言沒有第三方開發出相對應的套件，可看 codegen 使否有支援。

## pre-required

- Java7 or greater
	- 先必須確認有無安裝 [JDK](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) 
		- 驗證，開啟 terminal，執行 ```/usr/libexec/java_home```，會出現類似以下的 log
		```
		/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
		```
		- 若無，請點選上面連結，下載安裝即可。
	- 確認有設定路徑 ```echo $JAVA_HOME```
		- 若無，請設定 JAVA_HOME
			- ```cd ~```
			- 選定 ```.bashrc``` / ```.bash_profile``` / ```.profile``` 其中一個編輯
			- 以 ```.bashrc``` 為主，```vim .bashrc```，寫入你的 java_home 位置，```export JAVA_HOME="/usr/libexec/java_home"```，一般來說應該都在同一個位置
			- 編譯 ```source .bashrc```
			- 測試 ```echo $JAVA_HOME``` 
- Apache maven 3.0.3 or greater
	- 驗證，```mvn -v```
	
		```
		Apache Maven 3.3.3 (7994120775791599e205a5524ec3e0dfe41d4a06; 2015-04-22T19:57:37+08:00)  
		Maven home: /Users/name/apache-maven-3.3.3  
		Java version: 1.8.0_51, vendor: Oracle Corporation
		Java home: /Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home/jre
		Default locale: zh_TW, platform encoding: UTF-8
		OS name: "mac os x", version: "10.10.4", arch: "x86_64", family: "mac"
		```
	- 若無，[下載頁面](http://maven.apache.org/)
		- 安裝後，請將檔案移至適當的地方
		- 以 ```.bashrc``` 為主，```vim .bashrc```，輸入 
		```
		export MVN_HOME="/user/name/apache-maven-3.0.3"
		export MVN="$MVN_HOME/bin"
		export PATH="$MVN:$PATH"
		```
		- ```source .bashrc```
		- 驗證 ```mvn -v```

## 安裝（mac）

- git clone
- 確定有驗證過自己有必須安裝的軟體後，接下來就直接看 ```swagger-codegen/README.md``` 即可。

## 使用：To generate a sample client library
根據 README.md 中 "To generate a sample client library" 說明，該說明以 java 為主。    

### 以下為 php 測試

- ```cd bin```，可發現 ```php-petstore.sh``` 檔案，執行即可直接編譯 sample 檔案，```./bin/php-petstore.sh```。
	- 解開來看可發現關鍵兩行 
	```
	executable="./modules/swagger-codegen-cli/target/swagger-codegen-cli.jar"
	ags="$@ generate -t modules/swagger-codegen/src/main/resources/php -i modules/swagger-codegen/src/test/resources/2_0/petstore.json -l php -o samples/client/petstore/php"
	```
	- 其中 ```executable``` 為執行編譯的角色
	- 指令參數的文件檔，在 README.md 中有詳述，ags 中
		- ```-t```：套版檔案位置
		- ```-i```：swagger definition：petstore.json 位置
		- ```-l```：編譯語言
		- ```-o```：輸出的檔案位置
- ```cd /sample/client/petstore/php/SwaggerClient-php```，開啟 README.md ，按照文件進行 composer 更新與測試

### 其他
- 可在 ```./bin``` 中，找到各種 bash 檔案，可進行編輯修改為自己所需。

