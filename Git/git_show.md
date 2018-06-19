```
git show ebff # 查 log 是 commit ebff810c461ad1924fc422fd1d01db23d858773b 的內容
git show v1 # 查 tag:v1 的修改內容
git show v1:test.txt # 查 tag:v1 的 test.txt 檔案修改內容
git show HEAD # 此版本修改的資料
git show HEAD^ # 前一版修改的資料
git show HEAD^^ # 前前一版修改的資料
git show HEAD~4 # 前前前前一版修改的資料
```

# 只顯示修改的檔案名稱

`git show --name-only {commit-id}`
`git show --pretty="" --name-only {commit-id}`