# 通知

## slack
> 相關設定參數 http://plugins.drone.io/drone-plugins/drone-slack/

1. 建立 slack webhook 
	- https://slack.com/apps
	- 搜尋 Incoming WebHooks
	- Add Configuration
	- 建立後，會取得 
2. 了解要推送的 channel
3. 產生 drone.yml 檔案內容

```
pipeline:
  slack:
    image: plugins/slack
    webhook: https://hooks.slack.com/services/...
    channel: dev
    when:
      status: [ success, failure ]
```