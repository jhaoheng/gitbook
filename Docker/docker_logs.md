# docker logs

Usage : docker logs [OPTIONS] C



- docker logs -t [container] : 顯示時間
- docker logs -f [container] : 持續顯示 logs
- docker logs --tail=5 [container] : 顯示最後五筆
- docker logs --since=[date] [container] : 從什麼時候的時間點開始顯示
	- docker logs -t --since=2017-04-28T13 [container]
	- date 可從 docker logs -t [container] 中，看到相關格式

	
# 如何手動 echo 並出現在 logs

跟 /proc 有關
docker 預設的監聽資訊放在 /proc/1/fd/1 中

進入 container 中
echo hello >> /proc/1/fd/1
可透過 docker logs -ft [container_id] 查看

## 原因，為何是 /proc/1/fd/1

- PID 1 is the process launched by docker, and its STDOUT will be what docker picks up.
- 所以這是 docker 預設的
- 所以若要推送 log 給 docker logs，要送給這個路徑

## 透過 python 進行 print

```
f1=open('/proc/1/fd/1', 'w+')
print >> f1, 'hello world docker logs'
```