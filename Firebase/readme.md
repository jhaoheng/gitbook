# firebase message

api 有兩種
- 新
	- 針對 topic 可發多個 token, 但 app 需訂閱
	- 針對 token 只能一次傳一個裝置
	- 授權方式為 google api 的授權方式，且動態變更
- 舊
	- 一次可發多個 token
	- 授權方式固定

- android 只有 data 格式, 可在背景接收, 無論發送的對象用 topic 還是 token, 都會是一樣的結果

# 發送 payload 格式
> https://firebase.google.com/docs/cloud-messaging/http-server-ref?hl=zh-cn

- data : 對 android 可在背景接收, 對 ios 只能在前景
- notification : 對 android/ ios 均可前後接收, 唯一缺點為在 android 中, 背景接收到的訊息不會收束成一個, 造成狀態欄有多個訊息出現, 容易造成 ux 感官不好

# 新
1. 要求 access-token, scope 記得加入 `https://www.googleapis.com/auth/firebase.messaging`, redirect_uri 必須是 https 且 DNS 登記在 server 

	```
	https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id=1044867768193-45153uo92mu8vedvhbh3hk97v8ubbgt1.apps.googleusercontent.com&redirect_uri=https://localhost/v1.2/social/oauth_manager_web&scope=email+https://www.googleapis.com/auth/plus.me+profile+https://www.googleapis.com/auth/firebase.messaging
	```
2. 執行 (1) 會取得 access-token

	```
	{
		api_status: "success",
		api_status_code: "0",
		messages: {
			access_token: "ya29.GlvYBS3j8x...FQGcDt",
			token_type: "Bearer",
			expires_in: 3600,
			id_token: ""
		},
		debug_info: [ ]
	}
	```
3. 發送訊息, 將 access-token 帶入 Authorization, 記得更新 {project-id}

	```
	curl -X POST https://fcm.googleapis.com/v1/projects/{project-id}/messages:send -H "Content-Type: application/json" -H "Authorization: Bearer {access-token}" -d '{"message":{"notification":{"title":"FCM Message","body":"This is an FCM Message"},"token":"..."}}'
	```

# 舊
1. 得知 firebase : cloud messaging 的伺服器金鑰
2. 帶入 api 中的 Authorization key 的位置
```
curl -H "Authorization: key=..."\
 -H "Content-Type:application/json"\
  https://fcm.googleapis.com/fcm/send -d '{"registration_ids":[""], "notification":{"title":"maxtest2", "body":"body"}}}'
```