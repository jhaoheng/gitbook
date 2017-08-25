# 使用 docker-machine 部署 docker 到 aws

- 參考 : `https://docs.docker.com/machine/drivers/aws/`
- 指令參數表 : `https://docs.docker.com/machine/drivers/aws/#options`
	- 有些預設的參數要注意，如果沒有指定的情況下，會依照預設參數來建立 aws instance
		- ex : ami, region, zone, group, instance-type, device-name, root-size, volume-type, ssh-user, request-spot-instance, spot-price, use-private-address, private-address-only, monitoring, use-ebs-optimized-instance, retries
- nvidia-docker Deploy on Amazon EC2 : `https://github.com/NVIDIA/nvidia-docker/wiki/Deploy-on-Amazon-EC2`

## aws credentials
1. 登入 aws
2. 進入 IAM
3. 選擇 user
4. 給予需要使用的權限，在這邊選擇 ec2
5. 取得該 user 的 `AWS Access Key ID` 與 `AWS Secret Access Key`
6. 在使用 docker-machine 前，可使用以下兩種方法
	1. 通過 aws credentials 來設定 `AWS Access Key ID` 與 `AWS Secret Access Key`，建立的方法也有兩種
		1. 可透過 awscli，通過指令 `aws configure` 可協助設定好
		2. 也可直接建立 `~/.aws/credentials`，顯示格式如下
		
			```
			[default]
			aws_access_key_id = AKID1234567890
			aws_secret_access_key = MY-SECRET-KEY
			```
	2. 可透過 docker-machine : `$ docker-machine create --driver amazonec2 --amazonec2-access-key AKI******* --amazonec2-secret-key 8T93C*******  aws01` 來建立 docker-machine 的機器 
7. 測試建立
	- `docker-machine create --driver [instance_Name]` : 注意 default 參數值
		- zone : us-east-1
		- instance-type : t2.micro
		- root-size : 16
		- volume-type : gp2
		- ssh-user : ubuntu
		- 其他資訊請參考 docker-machine 說明
	- `docker-machine create --driver amazonec2 \
                      --amazonec2-region us-west-2 \
                      --amazonec2-zone b \
                      --amazonec2-ami ami-efd0428f \
                      --amazonec2-instance-type p2.xlarge \
                      --amazonec2-vpc-id vpc-*** \
                      --amazonec2-access-key AKI*** \
                      --amazonec2-secret-key *** \
                      aws01`
	    - 指定部分的參數操作

# 操作

透過 docker-machine ssh [name] 進行 ssh 的操作
# 未完待續