

## 指令結構 

mac 底下 root 的指令放在 /root/bin
而用戶的 bin 放在 `/usr/local/bin` 
homebrew 是安裝 `/usr/local`，輸出 `brew --list`，可看到 Cellear 中安裝什麼指令

## PATH

```
echo $PATH
echo $env
```
可在 .bashrc .bash_profile .profile 等延長路徑的設定

```
export $PATH=$PATH:/bin
```

## link

**用來建立連結用**
ln -s `source` `target`


## 安裝 homebrew

http://brew.sh/index_zh-tw.html

1. brew update

### brew install openssl : 安裝最新版

1. brew install openssl
2. brew link --force openssl //記住路徑 openssl_path/bin/
3. export PATH=....openssl_path/bin/:$PATH
4. openssl version
5. which openssl

### brew install curl : 安裝最新版

- 版本7.47 支援 http2/

## tree
`brew install tree`

## pip
[pip](https://pip.readthedocs.org/en/stable/installing/#install-pip)
透過 brew install python 的版本，自動包含 pip 檔案

## aws cli
[aws cli](https://aws.amazon.com/tw/cli/)

- troubleshooting : 用 osx 內建 python:2.7.10 出現問題

	```
	OSError: [Errno 1] Operation not permitted: '/var/folders/nc/b8n06prx1gzdwgsyrq7mmg4w0000gn/T/pip-ijruON-uninstall/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/six-1.4.1-py2.7.egg-info'
	```
	
	- [answer](https://github.com/tensorflow/tensorflow/issues/64)


## 查看當前用戶權限
```
cat /etc/passwd 
```

## 查詢當前角色
```
shell_exec('whoami')
```
shell_exec 為 php 執行時使用

## 產生指定角色的 ssk key
```
sudo -u <用戶名稱> ssh-keygen -t rsa
```

## 讓 server 認證該 ssh 的位置
```
sudo -u http ssh gitlab.com
```