# hls m3u8 詢問次數測試

- 目的 : 確認 播放器 在播放 hls 時，更新 m3u8 的機制與時間點

## 環境 

- php
- nginx
- aws s3
- aws dynamoDB
- VLC player

## 流程設計

1. 預先儲存
	- 影片(.ts)到 aws s3
	- 資訊到 aws dynamoDB
2. 從 api 給予時間與 key，搜尋影片片段，建立 m3u8 檔案，回傳給播放器
	- 每次 播放器，進行要求建立 m3u8 時，寫入 log 紀錄要求的時間
3. 查詢 log

## 第一次建立的 m3u8 file, 每次給予相同的 m3u8 檔案

```
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-ALLOW-CACHE:YES
#EXT-X-TARGETDURATION:8.334
EXT-X-MEDIA-SEQUENCE:1
#EXTINF:8.334, playback
{DNS}/1495615390360.ts
#EXTINF:8.3, playback
{DNS}/1495615398698.ts
#EXTINF:8.3, playback
{DNS}/1495615407037.ts
#EXTINF:8.3, playback
{DNS}/1495615415376.ts
#EXTINF:8.333, playback
{DNS}/1495615423720.ts
```

## 寫入的 log

[Sun, 28 May 17 20:11:56 +0800][INFO] 找尋 m3u8 +1 : 1495973516.44
[Sun, 28 May 17 20:12:12 +0800][INFO] 找尋 m3u8 +1 : 1495973532.82
[Sun, 28 May 17 20:12:20 +0800][INFO] 找尋 m3u8 +1 : 1495973540.66
[Sun, 28 May 17 20:12:28 +0800][INFO] 找尋 m3u8 +1 : 1495973548.69
[Sun, 28 May 17 20:12:36 +0800][INFO] 找尋 m3u8 +1 : 1495973556.76

## 結論

每次的 log 的時間、間隔，
log_2 - log_1 , duration = 16
log_3 - log_2 , duration = 8
log_4 - log_3 , duration = 8
log_5 - log_4 , duration = 8

log_1 : 第一次開始詢問, 開始播放第一個, 應該包含播放器的準備時間
log_2 : 第一個 ts 播放完畢, 開始播放第二個
log_3 : 第二個 ts 播放完畢, 開始播放第三個
log_4 : 第三個 ts 播放完畢, 開始播放第四個
log_5 : 第四個 ts 播放完畢, 開始播放第五個

播放器在每次播放完 ts 的檔案後，都會進行 api 的詢問，透過詢問，可產生下一次的 m3u8 檔案，
若更新 m3u8 後，記得需同時 `EXT-X-MEDIA-SEQUENCE` 進行 +1