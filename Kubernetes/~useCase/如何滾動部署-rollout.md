# rollout
> kubectl rollout --help
> format : `kubectl rollout <cmd> <resource type>`



## history
> 顯示所有的 rollout 歷史紀錄
> 包含版本號碼, 透過 undo 可以特別指定要回到哪一個紀錄

ex : `kubectl rollout history deployment` : 顯示全部
ex : `kubectl rollout history deployment/<name>` : 指定某個 deployment

## pause
> 暫停滾動
> `kubectl rollout pause deployment/<name>`

## resume
> 恢復滾動
> `kubectl rollout resume deployment/<name>`

## status
> 查看滾動狀態
> 建議當開始滾動時，就執行此指令，可以查看當下滾動狀態

ex : `kubectl rollout status deployment/<name>` : 一定要指定 <name>

## undo
> 回到某個版本
> `kubectl rollout undo deployment/<name> --to-revision=<版本號碼>`

1. 查詢版本號碼 : `kubectl rollout history deployment/<name>`
2. 回到指定版本 : `kubectl rollout undo deployment/<name> --to-revision=<版本號碼>`

若無指定版本, 則是回到先前的版本
