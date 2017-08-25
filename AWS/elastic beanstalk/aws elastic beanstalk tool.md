# aws elastic beanstalk tool

## install

- https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html?icmpid=docs_elasticbeanstalk_console
- `eb --version`

## 與 kubernates 比較
選用 kubernates 的最大原因會在於

1. 多數平台可用於部署
2. 穩定性
3. 一個社群在維護

## 與 Docker Swarm 比較

## 使用

1. 建立 `eb init`
2. 設定好 Dockerfile
3. 執行 `eb create` 會將底下的 Dockerfile 執行 
	- s3
	- ec2
	- elb
	- cloudwatch x2
	- auto scaling group
4. `eb open` 開啟 brokser 的網頁
5. 查詢用
	- eb status
	- eb logs
	- eb config
6. 關閉服務 `eb terminate`