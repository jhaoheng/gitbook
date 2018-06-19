## 說明

`angularjs is JavaScript framework`
而 angularjs-cli 會協助建立網站的 scaffold 與 componet 
建立起來的 scaffold 本身也具備所有的 angularjs 的特性，且多了框架與規範了開發規則，也就是 coding style

angularjs 的 framework 本來就支援既有的 angularjs 的所有功能，所以這部分要注意一下

## 安裝與反安裝

透過官網可以知道安裝的方式
> 注意 node & npm 版本

ng eject 後，會將原本使用 ng 指令，轉換為 webpack 的管理模式
要恢復成原來的 angularjs 需要透過 git 恢復以下兩個檔案
- `/.angular-cli.json`
- `/package.json`
移除掉
- `/webpack.config.js`

## 透過 cli 建立 scaffold

```
ng new {project}
cd {project}
ng serve
```
會在 localhost:4200 建立一個 hello world 頁面

## 如何啟動官網範例 Tour of Heroes

> 因為已經 eject 所以啟動方式如下

1. `npm install`
2. `npm start`

> 接下來可參考，TUTORIAL -> 2. The Hero Editor
> 若直接更新檔案，可直接獲得回饋

## cli wiki
https://github.com/angular/angular-cli/wiki
