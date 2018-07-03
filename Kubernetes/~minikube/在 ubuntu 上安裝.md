> ubuntu 16.04

1. `apt-get update && apt-get install wget lsb-release curl -y`
2. 參考 virtual 安裝網址 : https://www.virtualbox.org/wiki/Linux_Downloads
	- 檢查 ubuntu 版本 : `echo $(lsb_release -c -s)`, 顯示 xenial
	- `echo 'deb http://download.virtualbox.org/virtualbox/debian $(echo $(lsb_release -c -s)) contrib' >> /etc/apt/source.list`
	- The Oracle public key for apt-secure can be downloaded
		- `wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -`
		- `wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -`
	- `apt-get update`
	- `apt-get install virtualbox-5.2`
	- 驗證 virtualbox : `vboxmanage --version`
3. 安裝 kubectl
4. 安裝 minikube