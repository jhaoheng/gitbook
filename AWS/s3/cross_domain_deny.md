#【AWS S3】播放 HLS 時，發生 crossdomain access denied

# 環境

- player : http://video-dev.github.io/hls.js/demo/
- aws s3 
	- 將 ts 與 m3u8 均放在上面

# 解決 crossdomain access denied

- aws file : http://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html
- console 設定
	- 進入 bucket
	- 進入所選定的 folder 中
	- 選擇 Permissions
	- 看到 AllowedHeader
	- 寫入 *