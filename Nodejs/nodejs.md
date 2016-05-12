## Get start with npm(node package manager)

[docs](https://docs.npmjs.com/getting-started/what-is-npm)

## 關於 nodejs 與 iojs
nodejs 一開始從 0.1.14 -> 0.12.10  
io.js 則是延續 0.12.10，直接從 1.0 版開始到 3.3.1 版本  
到了 4.0.0 版本以上，則為 0.12.10 與 3.3.1 兩者的聯合衍生

## npm 版本更新

```
sudo npm install npm@latest -g
```

## nodeJs 版本更新

- [x] mac osx EI Capitan
- [x] nbuntu 15.10 // 安裝 npm 須將 apt-get 更新, 且需安裝 curl or wget
- [x] centOs 7.2.1511 // 先行 yum install epel-releasey, yum install npm, npm 須更新至最新版本號

```
node -v // 檢查目前版本
sudo npm cache clean -f  // 清空系統中所有 npm 的 cache
sudo npm install -g n // 安裝 n module，此為專門用於管理node/iojs執行檔版本的管理模組
sudo n stable // 透過 n 下載目前穩定版本號，亦可透過 n 進行指定版本的安裝 : sudo n 0.12.7
node -v // 最新版本號 5.6.0
```

## EACCES error (when install package globally)

It mean that you don't have permission....

Two way :
1. Change the permission to npm's default directory
2. Change npm's default directory to another directory
3. Use sude to do.

[option 1]

1. find the path ```npm config get prefix```
2. change the owner ```sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}``` 
	ps: the 'whoami' is your username in this computer
	
[option 2]


1. 新增路徑位置，本範例放在 root 下 ```mkdir ~/.nppm-global```
2. 設定 npm 指到新到路徑下 ```npm config set prefix "~/.npm-global"```
3. 開啟 ```~/.profile```，並加入 ```export PATH=~/.npm-global/bin:$PATH```，儲存離開
4. 執行 ```source ~/.profile```

ps : 2-4 的替代方案為，直接更改 ENV 的變數，如此一來就不用修改 ```~/.profile```  
	ex : ```NPM_CONFIG_PREFIX=~/.npm-global npm install -g jshint```