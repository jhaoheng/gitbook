# dynamodb

## 環境
- osx 10.11

## 如何連接本地端 dynamodb

1. 下載 http://docs.aws.amazon.com/zh_cn/amazondynamodb/latest/developerguide/DynamoDBLocal.html
2. 確認 java 版本
	- http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
	- 要 1.7 以上版本，不然無法啟動，會有錯誤訊息
3. 在 localhost dynamodb 的路徑下執行 : `java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb`
4. 測試 : `aws dynamodb list-tables --endpoint-url http://localhost:8000`
5. 透過 GUI 進行連線
	1. 下載 RazorSQL
	2. 左邊視窗選擇 connect to a database
		1. add connection profile -> choose DynamoDB(Amazon)
		2. RazorSQL DynamoDB Driver 
		3. set
			- Profile Name
			- AWS Access Key : 任意參數
			- AWS Secret Key : 任意參數
			- 勾選 Local DynamoDB
			- 設定 Max Rows per Query : 10
		4. 連線即可
	3. 先隨意建立一個 table
	4. 透過 terminal cli 查看 : `aws dynamodb list-tables --endpoint-url http://localhost:8000`

## 透過 code 進行本地端 dynamodb 連線

- http://docs.aws.amazon.com/zh_cn/amazondynamodb/latest/developerguide/DynamoDBLocal.Endpoint.html#w1ab1b9b9c13c11
	- java
	- .net
	- php

### php

```
$sdk = new Aws\Sdk([
    'endpoint'   => 'http://localhost:8000',  // Use DynamoDB running locally
    'region'   => 'us-west-2',  // US West (Oregon) Region
    'version'  => 'latest'  // Use the latest version of the AWS SDK for PHP
]);

// Create a new DynamoDB client
$dynamodb = $sdk->createDynamoDb();
```