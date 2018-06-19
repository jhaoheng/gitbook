# 透過指令

## 連線
`mongo://username:password@hostname/dbname`

> 使用 help, 可在 mongo 中查詢指令
> db.help()
> db.tables.help()
> db.collection.help()

## 管理 db
- 顯示所有 dbs : `show dbs`
- 創建 db : 
	- `use test`
	- `db`
	- 顯示所有 db 會發現，並不存在，需要建立資料才會顯示 : `db.test.insert({"name":"菜鳥"})`
		- 此會建立 collection(table)
		- 寫入一筆資料
- 刪除 db : 
	- `db.dropDatabase()`
	- 預設 db 為 test, 所以儘管沒有切換 dbname, 預設會執行刪除 test 的行為
	- 要刪除指定的 db, 要先切換 `use {db_name}`

## 管理 collection (table)
- 顯示所有 tables : `show tables` or `show collections`
- 刪除 tables : `db.{table_name}.drop()`
- 建立 table : `db.createCollection("{name}", options....)`
	- 在 MongoDB 中，你不需要創建集合。當你插入一些文檔時，MongoDB 會自動創建集合。

## 管理 document
- 寫入 : `db.{collection_name}.insert(...document...)`
	- document 全部都以 dictionary 的方式操作
- 顯示所有文檔 : 
	- `db.{collection_name}.find()`
	- `db.{col_name}.find().pretty()`
- 查詢指定文檔 : 
	- `db.{col_name}.find({query})`
		- {query} : 可選，設定查詢條件
	- value 查詢邏輯 : 小於`$lt`, 小於等於`$lte`, 大於`$gt`, 大於等於`$gte`, 不等於`$ne`
	- and : `db.col.find({key1:value1, key2:value2}).pretty()`
	- or : `db.col.find( {$or: [ {key1:value1}, {key2:value2} ]} )`
	- and , or 可以併用
- 更新文檔 : `db.{collection_name}.update( {query}, {update}, {optional} )`
	- {query} : update 的查詢條件，類似 sql update 查詢內 where 後面的。
	- {update} : 可以理解為 sql update 查詢內 set 後面的 keys & values
	- {optional} : 有 upsert, multi, writeConcern
		- upsert : 預設 false, 功能為若無此 key 可更新, 是否直接新增
		- multi : 預設 false, 功能為是否全更新, 還是只更新找到的第一條
- 用 save 更新 or 新增文檔
	- 新增 : `db.{col_name}.save({document})`
	- 更新 : `db.{col_name}.save({ "_id":...., {document} })`
- 刪除 
	- `db.{col_name}.remove( {query}, {justone:true, false} )`
		- {query} : 刪除文檔的條件
		- {justone} : 設置 true of false 為是否只刪除一條資訊
		- `db.col.remove({})` 刪除全部
	- `db.{col_name}.deleteOne({document})` : 刪除一個文檔
	- `db.{col_name}.deleteMany` : 全刪除

## 特殊

- 使用 `/搜尋的字詞/` 像是 like : ex `db.{col_name}.remove({"test":/he/})` 刪除所有 key = test, value 有 he 的 document

- TTL
	- 設定 collection 中，自動過期
		1. `db.col.createIndex( { "createdAt": 1 }, { expireAfterSeconds: 3600 } )`
		2. `db.col.insert( {"createdAt": new Date(), "logEvent":2, "msg":"...."} )`
	- col 中的所有 item 在指定時間後過期
		1. `db.col.createIndex( { "expireAt": 1 }, { expireAfterSeconds: 0 } )`
		2. `db.col.insert( { "expireAt": new Date(timestamp), "logEvent": 2, "logMessage": "Success!" } )`
		3. 時間設置規則 https://docs.mongodb.com/manual/reference/method/Date/




db.log_events.insert( {
   "expireAt": new Date(1523983940),
   "logEvent": 2,
   "logMessage": "Success!"
} )