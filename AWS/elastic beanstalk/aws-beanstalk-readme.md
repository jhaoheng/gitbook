# aws beanstalk

## Getting start

- Deploying a Web Application : http://docs.aws.amazon.com/gettingstarted/latest/deploy/awsgsg-deploy.pdf
- Full Developer Guide : http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/awseb-dg.pdf

## install 'eb' cmd

## how to use

### quick start

```
mkdir HelloWorld
cd HelloWorld
eb init -p php
echo "hello" > index.html
eb create dev-env
eb open
```

建立好後，可在 cmd line 上看到相關 log

```
Environment details for: dev-env
Application name: HelloWorld
Region: us-west-2
Deployed Version: app-170427_101536
Environment ID: e-r87hbiqbmp
Platform: 64bit Amazon Linux 2016.09 v2.3.3 running PHP 5.4
Tier: WebServer-Standard
CNAME: UNKNOWN
Updated: 2017-04-27 02:15:43.161000+00:00
```

要注意的有
1. application 建立在哪個地區
2. 