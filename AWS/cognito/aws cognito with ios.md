# aws cognito with ios

- 設定 ios aws sdk : http://docs.aws.amazon.com/zh_cn/mobile/sdkforios/developerguide/setup-aws-sdk-for-ios.html
	- 在側邊欄也有基礎的 cognito 設定/使用方法
- Cognito 說明與介紹 : http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/what-is-amazon-cognito.html
- sdk 下載 : https://github.com/aws/aws-sdk-ios
- sample 下載 : https://github.com/awslabs/aws-sdk-ios-samples
	- CognitoSync-Sample 需禁用 bitcode 才可以正常使用
		- 環境 
			- xcode : 8.3.2
			- ios 10.3.2
			- objective c
			- use cocoapod
- 使用授權的 flow : http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/authentication-flow.html
- 關於 STS : Security token service 的文章簡介 : https://blog.clifflu.net/2014/05/iam-role-%E8%88%87-sts/
- 比較 STS API : http://docs.aws.amazon.com/zh_cn/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison

## 1: 設定 aws cognito user pool

1. 設定 user pool
	- 要建立 app client => 提供 identity pool 設定用

## 2: Cognito User pool login, step

**參考 step 1~6 : http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/tutorial-integrating-user-pools-ios.html#tutorial-integrating-user-pools-get-aws-resource-cred-for-app-user**

1. 參考 sample 中的 CognitoYourUserPools-Sample
2. 在 Constants.m 中設定相關參數
3. 實機測試時，進行註冊，可在 aws cognito console 中，看到相關註冊資訊
4. 註冊完畢後，在使用 Federated Identities 進行暫行憑證的取得

## 3: 設定 AWS Congito Federated Identity Console
1. 設定 identity pool
	- 提供多種授權方法 : Cognito, Amazon, Facebook, Google+, Twitter, Custom
  	- http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/external-identity-providers.html
	- 完成後，會有各個平台的 sample code 可參考
2. 在 (1:) 中取得設定好的 user pool id , app client id 填入 Authentication providers 中的 cognito

## 4: Cognito Federated Identities login , step

### 取得 Cognito 授權登入，需先註冊完 cognito user pool
- 參考 : 
	- http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/tutorial-integrating-user-pools-ios.html#tutorial-integrating-user-pools-get-aws-resource-cred-for-app-user
	- http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/amazon-cognito-integrating-user-pools-with-identity-pools.html

```
// 設定 1
AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:nil];
// 設定 2
AWSCognitoIdentityUserPoolConfiguration *userPoolConfiguration = [[AWSCognitoIdentityUserPoolConfiguration alloc] initWithClientId:@"YOUR_CLIENT_ID"  clientSecret:@"YOUR_CLIENT_SECRET" poolId:@"YOUR_USER_POOL_ID"];
// 設定 3
[AWSCognitoIdentityUserPool registerCognitoIdentityUserPoolWithConfiguration:serviceConfiguration userPoolConfiguration:userPoolConfiguration forKey:@"UserPool"];

// 取得 user pool, 從 '設定 3' 中
AWSCognitoIdentityUserPool *pool = [AWSCognitoIdentityUserPool CognitoIdentityUserPoolForKey:@"UserPool"];

// 取得 credentailsProvider
AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId:@"YOUR_IDENTITY_POOL_ID" identityProviderManager:pool];
```

將憑證放入 serviceManager 中
```
AWSServiceConfiguration *defaultServiceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
        credentialsProvider:credentialsProvider];
AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = defaultServiceConfiguration;
```

### ex: facebook 授權登入，此為 sample 既有的範例

- 參考 sample 中的 CognitoSync-Sample
- sample 中，記得關閉 bitcode (預設是開啟)，否則實機測試會失敗(測試時間 20170520)
	- compile error : `linker command failed with exit code 1`

1. 在 app 中，設定好 facebook 的參數。在 cognito federated identities console 中開啟 facebook 的授權驗證。
2. 安裝 app 後就可以登入，並拿到 臨時的憑證(預設一小時)，可操作包含
	- synchronize data with Amazon Cognito Sync
	- Amazon DynamoDB
	- Amazon S3, and Amazon API Gateway

## 4: Using Tokens with User Pools

- 成功取得授權後，會得到三把 token : http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/amazon-cognito-user-pools-using-tokens-with-identity-providers.html
	- ID token
	- Access token
	- Refresh token

## 5: Cognito Federated Identities 其他操作
- Getting Credentials
 : http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/getting-credentials.html
- Accessing AWS Services : http://docs.aws.amazon.com/zh_cn/cognito/latest/developerguide/accessing-aws-services.html

## 6: Amazon Cognito Sync
透過 user pool 來同步手機資料，將用戶的某些資料放到 aws console 中，避免遺失，也可用於跨多裝置的使用

## 測試
1. 使用其他的身份供應商驗證
	- facebook 登入
	- google 登入
	- amazon
2. 使用自己的身份驗證系統後登入, email/password
3. 利用 sms 進行 註冊/登入




