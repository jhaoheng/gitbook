我已經知道從專案管理到開發的流程

現在還必須知道 deploy 的流程

也就是專案成員推到 master 後，並請求合併到 production 上
當管理人合併到 production 後，
隔天再進行 deploy 的動作，應該是 copy 每個檔案後，刪除掉 .git 的檔案

如果是網站，在 deploy 的時間中，必須設定一個 switch，讓網站處於 stand by 的畫面

如果中間加上，CI CD 又是不同的 deploy 的方法


所以應該區分為兩種
在 XDite 的文章中，應該是每個 pull request 都必須包含一組 CI

ticket -> CI(手動、自動) -> master -> production -> CD -> deploy target

在我原本的理解上

ticket -> unit test pass -> master -> CI -> CD -> deploy target

但或許是

ticket -> CI(unit test) -> release -> merge -> master -> CI(總測試) -> CD -> deploy target