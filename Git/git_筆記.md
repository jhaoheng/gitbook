複習的指令
http://fireqqtw.logdown.com/posts/196392-git-casually-notes
http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html

複習的遊戲
http://pcottle.github.io/learnGitBranching/

## 回復上一次的註解
```
git commit --amend
```

## 回復前幾次中的註解
```
git rebase -i HEAD~5
// 以 HEAD 為主，向前 5 個
// 進入後，將 pick 改為 edit後，執行
git commit --ammend
git rebase --continue
```

## 重新排列註解 Reordering
```
git rebase -i HEAD~2 //將 head 的前兩次提交，重新排序，輸入指令後，調整位置即可
```

## 擠壓(Squashing) 提交
將 兩 行的 commit，變為一行，注意這會將此兩行，合併到第三個
```
git rebase -i head~3
將 pick -> squash，儲存離開
會進入另一個編輯器，儲存離開後，git會整併這三個 commit 變為一個 commit
```

## 刪除 remote 端的 branch
```
git push origin --delete [branch name]
```

## 復原
### 已經 push
先去檢查 push 上去的 branch 是否處於被保護的狀態，解除
執行 
```
git reset --soft HEAD^
git reset HEAD <file>
git checkout <file>
git push -f origin master //將 remote 返回
```
### 已經 commit，尚未 push
```
git reset --soft HEAD^
```
### 已經 add，尚未 commit 
```
git reset HEAD <file>
```
### 已經更改檔案，尚未 add
```
git checkout <file>
```

### 強制復原（將所有一切回到某次的 commit 後）

```
git reset --hard HEAD^ //放棄所有修改，回到上個 commit 完成後的狀態

git reset --hard HEAD~2 //放棄所有修改，回到前兩次 commit 完成後的狀態 
```



## reset 與 revert

## 移動 branch 到其他的 commit-id 上
假設已有 <branch_name> 的分支
```
git checkout <commit-id>
git branch -f <branch_name>
```

## cherry-pick
將 tree 中指定的 commit-id，放到目前的 head 上
```
git cherry-pick <commit_id>  <commit_id>
```

## 將修改的部分丟入暫存
```
git stash //丟入暫存
```

## checkout 

### -f
強迫跳到某個 branch ，並捨棄掉變更（尚未 commit）的部分
```
git checkout -f <branch>
```
### -q
安靜的工作，不提供任何的反饋
```
git checkout -q <branch>
```


## 若要返回到初始狀態
```
git checkout <最早的 commit id>
git branch -f master
//將遠端的 origin master 與 local master 同步
git push -f origin master
//清除掉所有的 remote branch
git push origin --delete <branch>
//清除掉所有的 tag
git tag -d <tag>
//清除掉所有的 local branch
git branch -D <branch>
```

## 一次只 commit 部分 code
### partial
```git add -p <file>```   

- y		:	將此區塊(hunk)加入 stage
- n		:	不將此區塊加入 stage
- q		:	離開
- a		:	將目前的區塊加入 stage(包含該區塊之後的區塊)
- d		:	不將目前的區塊加入 stage(包含該區塊之後的區塊)
- g		:	系統給區塊號碼，選擇並跳到該區塊
- /		:	搜尋區塊
- j		:	離開目前的區塊(未決定)，前往下一個未決定的區塊
- J		:	離開目前的區塊(未決定)，前往下一個區塊
- k		:	離開目前的區塊(未決定)，檢視前一個尚未決定的區塊
- K		:	離開目前的區塊(未決定)，檢視前一個的區塊
- s		:	將目前的區塊再分割為小區塊
- e		:	手動編輯目前的區塊(hunk)
- ?		:	print help

### interactive 介面式互動的 git
```git add -i <file>``` 