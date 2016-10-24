## 安裝 redis

- http://redis.io/
- 下載後，執行網頁上安裝方法

### 將 redis 安裝到 /usr/local/bin 的方法

- `make install`
	- 更改預設安裝位置 : `make PREFIX=/some/other/directory install`
- 此方法會安裝 binaries 到系統中，但相關的 script 與配置檔，並不會放到是到的位置，因為只是 play
- 若需要安裝到正式的系統中，請使用
	- `cd utils`
	- `./install_server.sh`
	- 此種安裝方式會詢問幾個設定的問題，並且在 sys reboot 後會自動重新啟動
	- 手動停止與啟動 : `/etc/init.d/redis_<portnumber>`

## use

- 啟用伺服器
	- 直接啟用 : `src/redis-server`
	- 制定設定檔 : `./src/redis-server /path/to/redis.conf`
	- 透過指令直接覆蓋設定檔 : 
		- `./redis-server --port 9999 --slaveof 127.0.0.1 6379`
		- `./redis-server /etc/redis/6379.conf --loglevel debug`
		- 在 redis.conf 中的參數名稱，全部都支援使用 command line 進行設定。
- 啟用 client
	- `src/redis-cli`，進入互動介面
	- 測試
		- `ping`
		- `set foo bar`
		- `get foo`
	- 可直接下指令 `./redis_cli get foo` 取得參數
- `./redis_cli --help` : 查看一般指令
- `./redis_cli help {cmd}` : 取得指令相關資訊
- `./redis_cli command` : 取得全部指令

## 特性

- redis 是一個 key-value 的資料庫
- 資料結構儲存的特性
	- 儲存於 disk 上，儘管修改是透過 server memory。代表 redis 是快速的，也代表儲存是持久性的。
	- 在相同的高階編程語言下，redis 的效能結構儲存，相對優秀
	- Redis 提供很多 database 上習慣性的方法，如複製、tunable levels of durability、叢集、高度擴展
- Redis 提供更多複雜的使用方法，在 memcached 上。
- more
	* Introduction to Redis data types. http://redis.io/topics/data-types-intro
	* Try Redis directly inside your browser. http://try.redis.io
	* The full list of Redis commands. http://redis.io/commands
	* There is much more inside the Redis official documentation. http://redis.io/documentation
- 資料類型 : strings, arrays, integers, NULL, errors and so forth

## 測試

- 將 server 關閉後，依然取得到 key-value

## redis-cli

### basic

- 計數 : `redis-cli incr {變數名稱}`
- 寫入檔案 : `redis-cli incr {變數名稱} > ./output.txt`
- 取得 : `redis-cli get {變數名稱}`
	- 指定輸出為 raw `redis-cli --raw get {變數名稱}`
- 刪除 : 
	- `./redis-cli del {變數名稱}`
	- `./redis-cli flushall` : 刪除全部 keys from all db
	- `./redis-cli flushdb` : 從目前的 db 刪除掉所有的 keys
- 設定 : `redis-cli set {變數名稱}`
- 查看變數編碼屬性 : `OBJECT ENCODING {變數名稱}`
	- int
	- raw
	- embstr
	- more : <http://redisbook.com/preview/object/string.html>
- 接續 : `redis-cli append {變數名稱} "{延伸內容}"`
- 列出所有的 {變數名稱} : `KEYS *`
	- 列出指定內容的 {變數名稱} : `KEYS *o*`
- 查看 {變數名稱} 是否存在 : `./redis-cli exists {變數名稱} ...`

### Host, port, password and database

- Host, port
	- 預設的 ./redis-cli 設定為
		- server : 127.0.0.1 
		- port : 6379
	- specify `-h` & `-p` : `./redis-cli -h redis15.localnet.org -p 6390 ping`
- password
	- `./redis-cli a {password} ping`
- database
	- 預設會有 16 個 db，db 的名稱是用數字表達
	- basic
		- 查詢 db 數量 : `./redis-cli CONFIG GET databases`
		- 查詢每個 db 中的內存 : `./redis-cli INFO keyspace`
		- 指定 db 設定參數 : `./redis-cli -n 1 set {變數名稱} {內容}`
			- n 預設為 0 
		- 顯示目前此 db 的 key 數量 : `./redis-cli dbsize`
		- 移動 key 到另一個 db : `./redis-cli move {db_number}`

### Special modes of operation : `./redis-cli --help`

- 即時查看系統狀態 : `./redis-cli --stat`
- 分析 key : `redis-cli --bigkeys`
- Getting a list of keys : 
	- `./redis-cli --scan | head -10`
	- `./redis-cli --scan --pattern '*-11*'`
	- `redis-cli --scan --pattern 'user:*' | wc -l`
- Pub/sub mode
	- `publish {channel} {message}`
	- `subscribe {channel} ...`
	- `psubscribe {pattern}` : 設定 pattern 直接訂閱相關的頻道
		- pattern : ?, * , [ab]
			- `h?llo` 訂閱所有 `h?ll0` 相關頻道，只有一個字元
			- `h*llo` 訂閱所有 `h*llo` 相關頻道，* 可以是多個字元
			- `h[ae]llo` 訂閱 hallo 與 hello 頻道
- 即時監控目前 redis 所有的參數 : `./redis-cli monitor`
- 測試＋模擬 redis 的延遲 (以毫秒計): 
	- 基本 : `./redis-cli --latency -h {host} -p {port}`，可跨伺服器測試，預設為 localhost:6390
	- 每 15 秒 重新產生一次測試 : `./redis-cli --latency-history`
	- 圖像化顯示 : `./redis-cli --latency-dist`
	- 測試 redis 內部延遲，此依賴 cpu 效能
		- `./redis-cli --intrinsic-latency {秒數}` : 在 {秒數} 內測試
	- 文章
		- [淺談 Redis 超時](https://read01.com/yz68z4.html)
		- [Redis性能調優：保存SNAPSHOT對性能的影響](https://read01.com/O3a48K.html)
- Remote backups of RDB files
	- `./redis-cli --rdb /tmp/dump.rdb`
- 透過此指令，會複製 redis 上面載入的指令，到 slave，可清楚的看到下的指令順序是否正確 
	- `redis-cli --slave`
- Performing an LRU simulation 
	- 使用 LRU 測試，模擬效能
	- 透過設定 memory 與測試的 keys，來觀察效率 miss 的比例
	- <http://redis.io/topics/rediscli#performing-an-lru-simulation> 此篇有測試的過程