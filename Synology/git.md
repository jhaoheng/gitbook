## 官方文檔

[git server](https://www.synology.com/en-global/knowledgebase/DSM/help/Git/git)

## create git repo
1. 安裝 git server
2. 建立共用資料夾，ex: git/
3. 在共用資料夾底下，建立 ex: repo_name.git
4. ssh 進入 nas，`cd repo_name.git`，建立 init，`git init --bare`

## how to clone 

```
git clone ssh://<username>@huder.link:<port>/volume1/git/<repo>
```

## error

1. 注意 folder 權限，```chmod 777 <repo>```

## how to add remote

```
git remote add origin ssh://<username>@huder.link:<port>/volume1/git/<repo>
```
