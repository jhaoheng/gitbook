# GitHub Flow（五）：Deploy
[原文出處](https://guides.github.com/introduction/flow/)

## Deploy
一旦透過 pull request 完成代碼審查的動作，便可以部署該 branch 到某些環境下進行測試驗證（有可能是你的 master，但最好不要是 master ）。如果你的分支產生了一些問題，你就可以回朔該部署的測試環境，再返回你的 branch 進行 debug，如此一來就不會影響到他人的工作。

要注意的是，Deploy，並非 Merge 到 master。這只是一種環境整合測試的概念，你必須完成這一個階段，
再丟到 master，團隊合作開發比較不會受影響。