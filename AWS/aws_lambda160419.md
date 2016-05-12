30% -60% spot

 >=60 on demand 進場
 
 ECS Cluster
 
 external ELB
 internal ELB
 
 leverage

ECR

ECS Service Load Balancing -> img

Load Balancing on Random Ports -> img


AWS Lambda 
AWS API Gateway


AWS KINESTS


DynamoDB 


CloudTrail


## mobile integration

mobile sdk -> aws lambda
完全不需要設定其他的東西

or 

mobile sdk -> api gateway -> lambda


## 限制

- limit concurrency is 100
	- 可申請調整，此為保護機制，避免帳單過高

- 300s max duration per invocation

- Lambda in VPC restriction
	- private IP addresses
	- ENIC limit (default 20 * 5 = 100)

## api gateway

500-1000 QPS per AWS Account
5M requests /month = 18.79
100 QPS = 974.07 /month = 31,350 NTD

## performance

- push and pull invocation model of Lambda
	- pull
		- delegation with high memory 透過 memory 解決效能上的問題
- no connection pooling
	- 記得要關閉


## ECS

- 金融上的規格考量
- 長時間的 api request
- 語言上的考量
- 效能的考量 cpu

## serverless

- 小、輕量、簡單的邏輯
- 可以很輕鬆地與其他 AWS 服務整合

## 結論
盡量不要 ssh 進入 ec2，ec2 只是一個農場，死掉的農場，可以透過系統自動增生

## 520 另一場會議

Pahud Hsieh
twitter : @pahudnet
pahudnet@gmail.com




leetcode