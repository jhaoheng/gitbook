# 修改過去某一個 commit

1. 找到要修改的 commit code : `git log`
	- ex : `bbc643cd`
2. `git rebase --interactive 'bbc643cd^'`
	- 在要修改的 commit, 將 pick 改成 edit or e 後儲存, 會顯示提示
3. 輸入 : `git commit --amend`
	- 變更 commit 內容
4. 最後 `git rebase --continue` 回到先前的 head commit
5. 推到 origin : `git push -f origin master`