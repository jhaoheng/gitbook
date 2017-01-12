## os version

```cat /proc/version```
>
Linux version 3.10.35 (root@build2) (gcc version 4.7.3 20130102 (prerelease) (crosstool-NG 1.18.0) ) #5644 SMP Fri Jan 22 13:38:47 CST 2016

```cat /etc/*-release```
>
>CentOS release 6.7

[how to use yum](http://darkranger.no-ip.org/archives/v5/document/linux/yum.htm)

## vim

```yum install vim-X11 vim-common vim-enhanced vim-minimal```

-  ~/.vimrc

	```
	set history=700				" Sets how many lines of history VIM has to remember
	
	set nocompatible
	colo delek
	syntax on
	
	set showmode
	
	set autoindent
	set smartindent
	set backspace=eol,start,indent
	
	set expandtab
	set tabstop=4
	set shiftwidth=4
	set ruler
	
	set number
	set ignorecase
	set smartcase
	set hlsearch
	set backup
	set backupdir=~/vim/tmp/
	set nowrap
	set laststatus=2
	set cmdheight=2
	```

## wget
```
yum install wget
```

## git 2.7.1

[install git](https://www.howtoforge.com/how-to-install-the-latest-git-version-on-centos)

1. `yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils`
2. `cd /usr/src`
3. `wget https://www.kernel.org/pub/software/scm/git/git-2.7.2.tar.gz` : 先確認版本
4. `tar xzf git-2.7.2.tar.gz`
5. `cd git-2.7.2`
	- `make prefix=/usr/local/git all`
	- `make prefix=/usr/local/git install`
	- `echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc`
	- `source /etc/bashrc`
6. `git --version`

- debug
	- error: **Can't locate ExtUtils/MakeMaker.pm**
		- solve：```yum install perl-devel```
	- error: cannot run ssh: No such file or directory
		- 先檢查是否有建立 public ssh key 並放置到 git server 中
		- 要安裝 ```yum -y install  openssh*``` ， ```service sshd start```

## crontab install

```
# yum install cronie
# service crond start //start it with
# chkconfig crond on //To make it persistent, so that it starts on boot
```

- debug
	- 無法使用 service command
		- ```yum install initscripts```
	- Failed to get D-Bus connection: Operation not permitted
		- 改用 centos 6.7，centos 7 會出現此問提

- TEST
	- test.sh

		```
		#!/usr/bin/bash
		PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/git/bin:/usr/local/git/bin
		echo "hello" >> hello.log
		```

	- ```crontab -e```
	
		```
		#!/usr/bin/bash
	   PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/git/bin:/usr/local/git/bin
	    * * * * * /bin/bash /root/test.sh
		```
		
		
## nodejs / npm

[install](http://www.linuxfunda.com/2013/08/29/how-to-install-node-js-and-npm-on-centos-6-4/)
**nodejs version ,please follow this post step**
**dont do "Follow the below steps to install NPM"**
**just do "npm install 'packageName' is ok"**

## gitbook

[source](https://github.com/GitbookIO/gitbook)

- ~/.bashrc
	- ```cd gitbook;start.sh```

## openssh

```
yum install openssh
```


## rc.local

http://fecbob.pixnet.net/blog/post/38143179--%E3%80%90linux%E3%80%91rc.local%E8%87%AA%E5%95%9F%E5%8B%95%E5%AD%B8%E7%BF%92

## hook
應該是決定要的版本，然後指令
所以應該是 git hook 的進化版本，透過 production 的 remote ; git push production master
當 production master 被更新後，就啟動當地的 git hook，將本地的檔案更新
但若，每次 clone 下來就要重新加一次 remote
或者 web hook
執行某個 網頁 api ，將版本 pull 下來
無需設定 remote，只要設定好遠端的api路徑即可，但需要設定 git pull 的位置
沒辦法完整的連續技嗎....