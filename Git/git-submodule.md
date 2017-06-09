# git-submodule

- 新增 submodule : `git submodule add {repo} {建立的目錄}`
	- 建立後會產生 : .gitmodules, {建立的目錄} 兩個檔案
- .gitmodules : 這是一個設定檔


# 從 git 中初始化 submodule

> 當從 repo 中 git clone 下來後，若有 submodule，需要先初始化
> 初始化後，要更新 submodule

- 初始化 : `git submodule init`
- 更新 : `git submodule update`

# 查看 submodule

`git submodule status

# 移除 submodule

1. git rm --cached [目錄]
2. git rm [目錄]
3. vi .gitmodules : 移除不必要的 submodule
4. vi .git/config : 移除 submodule URL
5. git add . && git commit -m "Remove sub module" : 更新 git
6. git submodule sync