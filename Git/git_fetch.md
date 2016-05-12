```
git fetch -q --all
git merge origin master
```

當 fetch 後，還必須將目前的 branch 與 origin 中的 branch 進行合併

## pull & fetch

git pull和git fetch區別
git fetch 相當於從遠程獲取最新版本到本地，不會自動merge處理

通過git fetch –help查看官方描述為：

git fetch是遠程倉庫下載objects和refs，默認遠程倉庫名稱為origin，
git fetch origin master理解為從遠程origin倉庫下載master分支內容到本地的remotes/origin/master分支。
ref名稱和object名稱臨時保存在.git/FETCH_HEAD文件裡邊。

```
git fetch origin master
git branch -av
git log -p master.. origin/master # 比較master分支和origin/master分支差異
git merge origin/master # 將origin/master分支內容合併到本地master分支
```

理解過程為：

1、從遠程origin的master分支上下載最新的版本到origin/master分支上
2、比較本地的master分支和origin/master分支的區別
3、最後進行合併處理

等效為：

```
git fetch origin master:tmp # 從遠程origin下載master分支內容到本地tmp分支
git diff tmp # 比較當前master分支和tmp分支差異
git merge tmp # 將tmp分支內容合併到master分支
git branch -av # 查看當前版本庫全部分支情況
git branch -d tmp # 刪除掉臨時tmp本地分支
git pull 相當於是從遠程獲取最新版本並merge到本地
```

```
git pull origin master
```

理解過程為：

git pull = git fetch + git merge兩個過程。
在實際使用過程中，git fetch更安全，因為在merge之前，我們可以查看更新情況，決定是否合併