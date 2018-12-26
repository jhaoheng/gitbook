## 在多個 change_file/untrack 下, 如何 stash 某幾隻檔案

1. 將不要放入的檔案，進行 `git add <keep-file>`
2. 執行 `git stash --keep-index`
3. 查看 <keep-file> 是否保留