# git : [.gitattributes]

## 合併策略

- 在 project 的路徑下，同一層有 .git，建立 `.gitattributes`
- 建立要維持固定不變的設定檔 : config.json
- 在 `.gitattributes` 中新增合併策略 `config.json merge=ours`
- 完成後，查詢 `git config --global -l`，是否有 `merge.ours.driver=true` 的參數設定
- 若無則下指令 : `git config --global merge.ours.driver true`

## step flow

1. `git checkout -b [branch]`
2. edit config.json & commit
3. git checkout master
4. edit config.json & commit
5. 此時下 `git log --all --graph --pretty=format:'%C(auto)%h%C(auto)%d %s %C(dim white)(%aN, %ar)'`，會看到 branch 分別在兩條線，若是在同一條線上，並不會產生 conflict
6. git merge [branch]，讓兩條合併，此時產生 conflict，但因為設定的 `.gitattributes` 的規則，會讓每個分支合併後，以原本分支的檔案為主
7. 查看 `git log --all --graph --pretty=format:'%C(auto)%h%C(auto)%d %s %C(dim white)(%aN, %ar)'`