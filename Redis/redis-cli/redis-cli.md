## connect
- `redis-cli -h {host} -p {port} -a {password}`

## ping pong
- `redis-cli ping` : will return pong

## 數據類型的操作
- string : 此為基本型，透過 set / get 等操作，一個 key 等於一個 value
- hash : 
	- `redis-cli HMSET {key} {field_1_Name} {field_1_Value} {field_2_Name} {field_2_Value} ...`
	- `redis-cli HGET {key} {field_name}`
- list : 是簡單的字符串列表，按照插入順序排序。你可以添加一個元素到列表的頭部（左邊）或者尾部（右邊）。
- set(集合) : Redis的Set是string類型的無序集合。無序集合 = 後加入的 key 放到 index=0 依序往後推。`redis-cli sadd {key} {value}`
- zset : 有序集合。redis 通過分數來為集合中的成員進行從小到大的排序。`redis-cli zadd {key} {score} {value}`

## general key 操作
> 更多指令 : https://redis.io/commands
- 刪除 :`redis-cli del {key}` 
- 列出所有的 keys : 
	- `redis-cli keys '*'`
	- `redis-cli --scan --pattern '*'`
- 設定 key 的存活時間 : `redis-cli expire {key} {second}`
- 移除 key 的存活時間 : `redis-cli persist {key}`
- 取得 key 的剩餘存活時間 : 
	- 秒   : `redis-cli ttl {key}`
	- 毫秒 : `redis-cli pttl {key}` 
- key 是否存在 : `redis-cli exists {key}`
- 取出符合 pattern 的 key : `redis-cli keys {pattern}` , ex : `redis-cli keys time*`
- 修改 key 的名稱 : `redis-cli renamenx {key} {newkey}`
- 取得 key 儲存的值的類型 : `redis-cli type {key}`

## string 類型 key 的操作
- 新增 : `redis-cli set {key} {value}`
- 取得 : `redis-cli get {key}`

## hash 類型 key 的操作
- `redis-cli HMSET {key} {field_1_Name} {field_1_Value} {field_2_Name} {field_2_Value} ...`
- `redis-cli HGET {key} {field_name}`
- `redis-cli HGETALL`

## list 類型 key 操作
- `redis lpush {key} {value}`

## set 類型 key 操作
- `redis-cli sadd {key} {value}`
- `redis-cli smembers {key}`

## zset 類型 key 操作
- `redis-cli zadd {key} {score} {member}`
- `redis-cli zrangebyscore {key} {start_score} {end_score}`



