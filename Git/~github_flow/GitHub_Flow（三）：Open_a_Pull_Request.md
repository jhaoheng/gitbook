# GitHub Flow（三）：Open a Pull Request

[原文出處](https://guides.github.com/introduction/flow/)

## Open a Pull Request
Pull Requests 的啟動，是根據你所遞交的 commits。因為在 Git repository 上的所有行為，都緊密的整合在一起，任何人都可以看到現存要合併的變化有哪些，但前提是，他們接受你的請求。

在開發流程中，都能開啟 pull request：當你只是想分享一些想法或者截圖時（沒有或一些代碼），當你陷入瓶頸與需要一些幫助或建言，或者當你準備好讓某些人來審查你的代碼。在你的 Pull request message 中使用 GitHub's @mention 系統，你可以詢問一些問題，並指定該人與團隊反饋你的詢問，無論當下該人或者該團隊正在下樓或者在其他國家，系統都會記錄該事件，並且當有回饋時，通知你。

## ProTip

Pull Requests 對持續貢獻的 open source 與 管理已分享的資源庫中的變動 是非常有幫助。若你使用 Fork & Pull Model，Pull requests 針對任何的變更都會提供通知訊息給專案維護者，若你使用 Shared Repository Model，在合併到 master 前，Pull Requests 會啟動『關於提議變動』的代碼審查與溝通。

所以簡單來說，做好 branch 的建立，並且該 branch 管理者，不論是想討論或者請求 [代碼審查](http://maxdev.huder.link/2015/07/pre-merge-code-reviews.html)，都可以執行 pull request 通知他人，進行討論。

當然工作的方式有許多種，越多越細的 commit，也可幫助自己在重構代碼時的一個折返點。