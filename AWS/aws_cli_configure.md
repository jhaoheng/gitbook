# aws cli

- github : https://github.com/aws/aws-cli/releases
- 安裝 & 更新 & 反安裝 : `http://docs.aws.amazon.com/cli/latest/userguide/installing.html`
- cli 中指令的參考 : `http://docs.aws.amazon.com/cli/latest/index.html`
	- `aws help` : 可看到所有指令
- 查詢各類指令說明 : 
	- `aws help`
	- `aws {command} help`
	- `aws {command} {sub-cmd} help`
- aws Command Completion : `http://docs.aws.amazon.com/cli/latest/userguide/cli-command-completion.html`
	- 透過 tab 搜尋 aws 相關指令, install :
		1. `echo $SHELL`
		2. find path : `which aws_completer`
		3. enable : `complete -C '/usr/local/bin/aws_completer' aws`

## 設定 profile
- resource : `http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html`
- 請到 iam 取得以下 
	- AWS Access Key ID
	- AWS Secret Access Key 
- `aws configure help` : 查詢在 configure 中的指令有哪些可用
- 設定 profile
	- `aws configure`
	- `aws configure --profile user2`
- 列出 profile
	- `aws configure list` : 預設
	- `aws configure list --profile default` : 指定身份
- 使用 profile
	- `aws ec2 describe-instance`
	- `aws ec2 describe-instance --profile user2`
- 指定使用哪一個 profile
	- `export AWS_PROFILE=user2` : AWS_PROFILE 為 Environment Variables
	- `unset AWS_PROFILE` : 回到預設值 
	- Profile Environment Variables
		- AWS_ACCESS_KEY_ID
		- AWS_SECRET_ACCESS_KEY
		- AWS_SESSION_TOKEN
		- AWS_DEFAULT_REGION
		- AWS_DEFAULT_OUTPUT
		- AWS_PROFILE
		- AWS_CA_BUNDLE
		- AWS_SHARED_CREDENTIALS_FILE
		- AWS_CONFIG_FILE
- Options
	- `--profile`		: 指定使用 profile
	- `--region` 		: 指定地區
		- 顯示地區列表 : `aws ec2 describe-regions --output table`
	- `--output` 		: json | text | table
	- `--endpoint-url` : 指定 
	- ex : `aws ec2 describe-instances --output table --region ap-northeast-2`