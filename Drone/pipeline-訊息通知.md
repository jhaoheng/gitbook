# 訊息通知

```
discord:
	image: appleboy/drone-discord
	pull: true
	secrets:
		- source: webhook_prod_id
		  target: webhook_id
		- source: webhook_prod_token
		  target: webhook_token
	when:
		status: [ success, failure ]
```