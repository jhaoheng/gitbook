# 神準 + orbweb(GTMT) => CWD

## 整個服務有

- FE
- BE
- AUTH
- api x2
- service
	- IP Camera : RTMP->HLS->PHONE, HLS 約 10-15 秒
		- 未來目標走 RTMP
	- Sensor
	- Smart Switch
	- Smart Lighting
	- Smart Locker
- 拓樸中還有 MQTT

## deploy 的方法是

- docker push
- gcloud docker push : GKE, Google率先發表了可部署和管理大量Container叢集的GKE
- kubectl : kubernetem 的服務，來創建 GKE

http://searchitoperations.techtarget.com/definition/Google-Container-Engine-GKE

Google Container Engine is comprised of a group of Google Compute Engine instances, which run Kubernetes.

所以應該是透過 gcloud 放上去
再透過 kubectl 去執行 cluster 的建立

Users can interact with Google Container Engine using the gcloud command line interface or the Google Cloud Platform Console.

# brew install kubernetes-cli



# 設定 gcloud
https://cloud.google.com/sdk/docs/?authuser=1#linux

- python 2.7
- 安裝教學 : https://cloud.google.com/sdk/docs/quickstart-linux?authuser=1
	- scp -i mykey.pem somefile.txt centos@ec2-52-196-117-19.ap-northeast-1.compute.amazonaws.com:/[注意檔案權限]

- [安裝 sdk](https://cloud.google.com/sdk/docs/quickstart-linux?authuser=1)
	- `gcloud init` : These include 
		- authorizing the SDK tools to access Google Cloud Platform using your user account credentials 
		- setting up the default SDK configuration.
	- `gcloud auth list` : To list accounts whose credentials are stored on the local system
	- `gcloud config list` : To list the properties in your active SDK configuration
	- `gcloud info` : To view information your Cloud SDK installation and the active SDK configuration
	- `gcloud help` : To view information about gcloud commands and other topics from the command line
		- `gcloud help compute instances create` : to view the help for 'gcloud compute instances create'

```
You are logged in as: [max.hu@orbweb.com].

Your current project has been set to: [gotomythings].

Do you want to configure Google Compute Engine 
(https://cloud.google.com/compute) settings (Y/n)?  n

Created a default .boto configuration file at [/home/centos/.boto]. See this file and
[https://cloud.google.com/storage/docs/gsutil/commands/config] for more
information about configuring Google Cloud Storage.
Your Google Cloud SDK is configured and ready to use!

* Commands that require authentication will use max.hu@orbweb.com by default
* Commands will reference project `gotomythings` by default
Run `gcloud help config` to learn how to change individual settings

This gcloud configuration is called [default]. You can create additional configurations if you work with multiple accounts and/or projects.
Run `gcloud topic configurations` to learn more.

Some things to try next:

* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command.
* Run `gcloud topic -h` to learn about advanced features of the SDK like arg files and output formatting
```

## gcloud api

- Read the gcloud Tool Guide for an overview of the gcloud command-line tool. 
	- https://cloud.google.com/sdk/gcloud/?authuser=1
	- manager
		- Google Compute Engine virtual machine instances and other resources
		- Google Cloud SQL instances
		- Google Container Engine clusters
		- Google Cloud Dataproc clusters and jobs
		- Google Cloud DNS managed zones and record sets
		- Google Cloud Deployment manager deployments
- Read the gcloud Reference Guide for descriptions of the gcloud commands that you can use to perform a variety of tasks on Google Cloud Platform.
	- https://cloud.google.com/sdk/gcloud/reference/?authuser=1

- `gcloud`
	- NAME : " manage Google Cloud Platform resources and developer workflow
	- DESCRIPTION : gcloud CLI manages authentication, local configuration, developer workflow, and interactions with the Google Cloud Platform APIs.

- `gcloud docker` : gcloud docker - provides the docker CLI access to the Google Container Registry

## gsutil api

- gsutil is a Python application that lets you access Cloud Storage from the command line. You can use gsutil to do a wide range of bucket and object management tasks, including:
	- Creating and deleting buckets.
	- Uploading, downloading, and deleting objects.
	- Listing buckets and objects.
	- Moving, copying, and renaming objects.
	- Editing object and bucket ACLs.


