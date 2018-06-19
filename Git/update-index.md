> https://git-scm.com/docs/git-update-index#git-update-index---no-skip-worktree

# 更新 git 時，忽略更新某檔案
- git update-index --skip-worktree <file_name>

# 把忽略的檔案重新放回 tree 中
- git undate-index --no-skip-worktree <file_name>

# 查詢目前忽略的檔案
```
H cached
S skip-worktree
M unmerged
R removed/deleted
C modified/changed
K to be killed
? other
```

- git ls-files -v | grep ^S