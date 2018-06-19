# 壓縮 commits -> commit

1. 在某一個 branch
2. 查詢 `git log`
3. 選擇一開始要壓縮的 commit id 位置
	- ex : 要將 new 0-2 的 commit 壓縮到 new-3, 需選擇 new-3 的 commit id
		- new-0 : 最新的 commit
		- new-1
		- new-2
		- new-3 : 最舊的 commit 
4. rebase
	- `git rebase -i head~3`
	- or `git rebase -i {new-3 commit id}`

```
pick 614f1cc new-0
s 6cdb596 new-1
s 55ce952 new-2
```

確定要壓縮的內容後，存檔，就會直接進入 commit comment 修改的畫面

5. 若 第四步驟中的 rebase 中的 設定選錯, 則不會直接進入修改 commit comment 的畫面, 會回到命令視窗中, git 會提示你該做什麼

# 合併分支

> git rebase <當做基底的 commit> <要併入的 commit>

目前有兩個分支 b1, b2

init -> c1 (b1) 
	 -> c2 -> c3 (b2)

現在要合併 b1 / b2, 使圖形變成
init -> c1 -> c2 -> c3

將 b2 -> b1 中
git rebase b1 b2


	