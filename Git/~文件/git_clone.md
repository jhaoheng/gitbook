# git clone

## DESCRIPTION

複製一個 repo 到一個新的路徑中，在此複製的 repo 中建立一個遠端追蹤的分支（可用 git branch -r 來觀看遠端有什麼分支）。

默認的 clone 配置，會依照目前分支(master) head 為主:`refs/remotes/origin`，初始化的設定透過`remote.origin.url`、`remote.origin.fetch`這兩個變量進行設定。 


## usage

```usage: git clone [<options>] [--] <repo> [<dir>]```

## options

- -v, --verbose : be more verbose
- -q, --quiet : be more quiet
- --progress : force progress reporting
- -n, --no-checkout : don't create a checkout
- --bare : create a bare repository
- --mirror : create a mirror repository (implies bare)
- --local, -l : to clone from a local repository
- --no-hardlinks : don't use local hardlinks, always copy
	- 如果只是想試著備份你的 repository 時，使用此方法。
- -s, --shared : setup as shared repository
- --recursive : initialize submodules in the clone
- --recurse-submodules : initialize submodules in the clone
- --template <template-directory> : directory from which templates will be used
- --reference <repo> : reference repository
	- `git clone --reference <repo> <repo> [<dir>]`
- --dissociate : use --reference only while cloning
- -o, --origin <name> : use <name> instead of 'origin' to track upstream
- -b, --branch <branch> : checkout <branch> instead of the remote's HEAD
	- `git clone --depth=50 --branch=master`
- -u, --upload-pack <path> : path to git-upload-pack on the remote
- --depth <depth> : create a shallow clone of that depth
	- 指定創建的 log 歷史數量，`git clone --depth=2 <repo>`，只截取兩個 log 當作此 clone 的 log 歷史
- --single-branch : clone only one branch, HEAD or --branch
- --separate-git-dir <gitdir> : separate git dir from working tree
- -c, --config <key=value> : set config inside the new repository
