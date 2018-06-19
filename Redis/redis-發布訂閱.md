# pubsub

- 要監聽 task，則訂閱一個 channel
## 監聽 過期的 key
- 要訂閱 `__keyevent@0__:expired`, ex : `redis-cli subscribe __keyevent@0__:expired`
- 0 表示 db0 根據自己的 dbindex 選擇合適的數字
- ex : `redis-server --protected-mode no --notify-keyspace-events Ex`
	
```
# K    鍵空間通知，以__keyspace@<db>__為前綴
# E    鍵事件通知，以__keysevent@<db>__為前綴
# g    del , expipre , rename 等類型無關的通用命令的通知, ...
# $    String命令
# l    List命令
# s    Set命令
# h    Hash命令
# z    有序集合命令
# x    過期事件（每次key過期時生成）
# e    驅逐事件（當key在內存滿了被清除時生成）
# A    g$lshzxe的別名，因此」AKE」意味著所有的事件
```

## basic

- 訂閱 : `redis-cli subscribe {channel}`
- 發布 : `redis-cli publish {channel} {meaages}`

## command

- 查看目前所有的頻道 : `redis-cli pubsub channels`
- 退訂 : `redis-cli unsubscirbe {channel}`