# git checkout 

## usage

`git checkout [<options>] <branch>`  
or  
`git checkout [<options>] [<branch>] -- <file>`

## options

- -q, --quiet : 
- -b <branch>
- -B <branch> : create/reset and checkout a branch
	- 若已有該名稱的 <ori_brnach>，則參考目前的 <active branch> 進行 create，無論 <ori_brnach> 是否有變更，直接覆蓋。
- -l : create reflog for new branch
- --detach : detach the HEAD at named commit
	- 分離 head 與目前的 branch，不過一般來說直接 `git checkout commit-id` 即可