# google
> https://developers.google.com/identity/protocols/OAuth2WebServer#protectauthcode

# 使用 id_token，並取得用戶資訊
> app 會使用這個流程

## 1. 取得 code
```
https://accounts.google.com/o/oauth2/v2/auth? 
scope=email&
access_type=online&
include_granted_scopes=true&
state=state_parameter_passthrough_value&
response_type=code&
redirect_uri={...}&
client_id={google_client_id}
```
## 2. 取得 token

- Method: post
- Host: www.googleapis.com
- Content-Type: application/x-www-form-urlencoded
	- code
	- client_id
	- client_secret
	- redirect_uri
	- grant_type= authorization_code

```
curl -X POST \
  https://www.googleapis.com/oauth2/v4/token \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'code=4%2FxAvGFzmMpJGzJqlGr4eXtOIkqH582kuJ7ifj7GYZXDc&client_id=771087177395-pm7fuqamhquk7n4nqir114odk6r9v1rl.apps.googleusercontent.com&client_secret=h3Rzv-Tgb298rYEJDkC84ReS&redirect_uri=http%3A%2F%2Flocalhost%2Fv1.2%2Fsocial%2Fcheck&grant_type=authorization_code'
```

## 3. 驗證

- 返回 jsonformat
- 有錯誤會有錯誤訊息

```
curl -X GET https://www.googleapis.com/oauth2/v3/tokeninfo?id_token={...}
```
# 取得 access_token，並取得用戶資訊
## 1. 取得 access_token

```
curl -X GET https://accounts.google.com/o/oauth2/auth?response_type=token&client_id={client_id}&redirect_uri=...&scope=email
```

## 2. 驗證
- 驗證 : `https://www.googleapis.com/oauth2/v2/userinfo?alt=json&access_token={access_token}`

