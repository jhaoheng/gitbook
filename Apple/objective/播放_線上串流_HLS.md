# 播放 線上串流 HLS

- 格式 : m3u8
	- 測試檔案 : https://mega.nz/#F!ugxGEBaZ!z7OI0twEpBYdgGxUH7G5zw
- github : <https://github.com/jhaoheng/HLS_sample>

## apple 支援
- https://developer.apple.com/streaming/#streaming

- 使用 framework
	- <AVKit/AVKit.h> : ios9 only
	- <AVFoundation/AVFoundation.h>
	- <MediaPlayer/MediaPlayer.h> : ios8 以下

## 轉換工具 ffmpeg

因已安裝 homebrew 故
```
brew install ffmpeg
```

## 格式轉換
```
ffmpeg -i <filename>.mp4 -c:v libx264 -c:a copy -f hls <outputNmae>.m3u8
```

## 透過 safari 播放測試 m3u8

1. 開啟 safari
2. 將 url 放入即可

## HLS Server 

- Web Server：提供 m3u8 播放清單。
- Transcoder：若檔案內容並非 H.264 + AAC，那麼便需要進行轉檔。
- Media Stream Segmenter：將欲播放的檔案切成 segment。

## 注意

1. 如果影像長度超過10分鐘，或是每五分鐘會傳輸大於5MB資料量，就必須使用 HLS
2. 必須提供一個 64Kbps或是更低頻寬的串流 

原文如下： 

> If your app delivers video over cellular networks, and the video exceeds either 10 minutes duration or 5 MB of data in a five minute period, you are required to use HTTP Live Streaming. (Progressive download may be used for smaller clips.) 
>
If your app uses HTTP Live Streaming over cellular networks, you are required to provide at least one stream at 64 Kbps or lower bandwidth (the low-bandwidth stream may be audio-only or audio with a still image). 
>
These requirements apply to iOS apps submitted for distribution in the App Store for use on Apple products. Non-compliant apps may be rejected or removed, at the discretion of Apple.  

實際上許多 app 仍然使用 RTSP 協定，並且也成功上架了，Apple對於這點並沒有嚴格審查。