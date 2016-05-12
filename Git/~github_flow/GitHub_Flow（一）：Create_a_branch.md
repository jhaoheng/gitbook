# GitHub Flow（一）：Create a branch

[原文出處](https://guides.github.com/introduction/flow/)

## Create a branch

執行專案時，在被允許的時間下，會因為不同的功能、想法而建立不同的分支，有些已經確認方向可以被執行，而其他的可能沒有。Branching 的作用在於幫助你管理所有的 workflow。

當你在專案中建立一個 branch，你便在該專案環境中建立了一個可以被實踐某想法的環境（不會影響到其他人的工作為前提）。在分支中，你的任何改變都不會影響 master 分支，所以你可以自由的實驗與遞交任何改變，你所建立的 branch 在未合併到其他分支（maybe master）前，branch 下任何修改對整個專案都是安全的，直到這個分支你所貢獻的一切已經準備好可以被其他人給『審查』。（詳見[代碼審查](http://maxdev.huder.link/2015/07/pre-merge-code-reviews.html)）

## ProTip
Branching 在 Git 中是一個核心概念，而整個 GitHub Flow 也以他為基礎。只有一個規則：在 master branch 中，任何方式都可以被部署。（應該是指任何東西都可以從 master 中延展其他分支，進而針對分支進行開發）

基於此點原因，你的 new branch 從 master 中產生，目的在於進行其他的開發與修正。你的 branch name 的命名就應該與你的任務有正相關。
 (e.g., refactor-authentication, user-content-cache-key, make-retina-avatars)
 所以其他人可以從你的『命名條件下』知道這個分支的目的在做什麼，這非常重要。
