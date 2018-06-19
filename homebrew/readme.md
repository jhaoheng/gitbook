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

1. `brew install openssl`
2. `brew link --force openssl` //記住路徑 openssl_path/bin/
3. `export PATH=....openssl_path/bin/:$PATH`
4. `openssl version`
5. `which openssl`

### brew install curl : 安裝最新版

- 版本7.47 支援 http2/