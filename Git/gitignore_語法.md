# gitignore 語法
## 路徑
```
vim .git/info/exclude
```

## 語法
```
# //註解
*.[oa] //所有副檔名 .o 與 .a 的文件
*.~
*.html //忽略所有副檔名為 html 的文件
!foo.html //foo.html，將被強制保留
```

### 忽略包含所有的東西，除了 foo/bar 路徑下的文件
```
/*
!/foo
/foo/*
!/foo/bar
```

## 已經送交版本庫的檔案，事後設定 .gitignore 是沒用的
### 此時可用下述指令來告訴 Git 某個檔案已經不需要版本庫控制

```
git rm --cached <fileName>
```

## 建立 Global gitignore file
來源 : [githu](https://help.github.com/articles/ignoring-files/)
可以在電腦的位置中，建立 global gitignore file，讓你的電腦，只要使用 gitignore 就會直接引用該檔案  
像是你可以在 ```cd ~``` 的位置建立他，記住 link 的路徑與設定的路徑要正確即可
```
git config --global core.excludesfile ~/.gitignore_global
```

你必須利用 ```pwd``` 取得絕對路徑，才可以設定正確  
不然在該 git_folder 下，用 ```git config -l``` 查看  
只會看到相對路徑