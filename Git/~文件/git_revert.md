**跟 reset 雷同，但在 tree 中會往前，不像 reset，是重新某個動作**

## usage

```
usage: git revert [<options>] <commit-ish>...
   or: git revert <subcommand>
```

## options

- --quit : end revert or cherry-pick sequence
- --continue : resume revert or cherry-pick sequence
- --abort : cancel revert or cherry-pick sequence
- -n, --no-commit : don't automatically commit
- -e, --edit : edit the commit message
- -s, --signoff : add Signed-off-by:
- -m, --mainline <n>  : parent number
- --rerere-autoupdate : pdate the index with reused conflict resolution if possible
- --strategy <strategy> : merge strategy
- -X, --strategy-option <option> : option for merge strategy
- -S, --gpg-sign[=<key-id>] : GPG sign commit