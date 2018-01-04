所以他的做法是

1. 建立工作路徑
2. 在工作路徑，建立 `Dockerrun.aws.json`
3. 在工作路徑，建立 `.extension/newrelic.config`
	- 但不清楚 newrelic 如何自動化？
4. 壓縮工作路徑，並上傳到 s3
5. 透過 aws elasticbeanstalk 建立一個版本
6. 透過 aws elasticbeanstalk 進行版本更新

docker login -u ec2-rds-nv -p asrock88888 -e none 838100493014.dkr.ecr.us-east-1.amazonaws.com
 

```
(cd $WORK_DIR; zip -r - .) | aws s3 cp - s3://$S3BUCKET/$APPLICATION_NAME/versions/$VERSION.zip
```

```
aws elasticbeanstalk create-application-version \
	--application-name $APPLICATION_NAME \
    --version-label $VERSION \
    --source-bundle S3Bucket=$S3BUCKET,S3Key=$APPLICATION_NAME/versions/$VERSION.zip
```

```
APPLICATION_NAME=orbweb-web
AWS_ENVIRONMENT=orbweb-web-staging

echo "Deploying $APPLICATION_VERSION to $AWS_ENVIRONMENT($AWS_DEFAULT_REGION)"

aws elasticbeanstalk update-environment \
	--environment-name $AWS_ENVIRONMENT \
    --version-label $APPLICATION_VERSION
``` 

# asrock deploy flow

## 建立 aws docker image repo
1. 建立 ECR 
	1. 開啟 AWS console -> 選擇 Amazon ECS 的服務 -> 選擇 Repositories
	2. 選擇 create repository
	3. 建立完成後，會看到上傳的方法
2. 按照 ecs 中，的說明 aws ecr get-login 後，會產生出 docker login ... 的語法，透過這個進行 docker login
	1. `aws ecr get-login --no-include-email --region us-east-1` : 取得 `docker login -u AWS -p .... `
	2. 依據 1 中取得的 login 指令，進行 docker login
3. 上傳 docker image 到 ECR 中
	1. `docker build -t xxx {image}`
	2. `docker tag xxx your-ecr-position/your-repo-name:latest`
	3. `docker push your-ecr-position/your-repo-name:latest`

## 透過 beanstalk 部署

0. 建立好一個 eb application
1. 設定好 `Dockerrun.aws.json`
	- `envsubst` 可善用此指令
2. 壓縮 含有設定檔的 folder，並上傳到 aws s3
	- `cd folder && zip -r $folder.zip ./ && aws s3 cp v1.1.7-rc1.zip s3://{bucket_name}/{folder.zip}`
3. 建立 eb 新的版本
	```
	aws elasticbeanstalk create-application-version \
	--application-name {your-eb-application-name} \
    --version-label {your-eb-version-label}\
    --source-bundle S3Bucket={bucket_name},S3Key={folder.zip}
    ```
4. 部署新版本
	```
	aws elasticbeanstalk update-environment \
	--environment-name {your-eb-application-name} \
    --version-label {your-eb-version-label}
	```

