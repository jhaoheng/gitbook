# 若 cherry-pick 別人的 commit 產生 conflict

1. 先 undo cherry-pick	: `git cherry-pick --abort`
2. 執行 cherry-pick 的 strategy : 
	- try to make cherry-pick, but in this time you get their changes not yours, so make this
	- `git cherry-pick --strategy=recursive -X theirs {Imported_Commit}`