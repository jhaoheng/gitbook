# GitHub Flow（二）：Add Commits

[原文出處](https://guides.github.com/introduction/flow/)

## Add Commit

一旦 branch 被建立後，便可在該 branch 下開始進行編程。無論你進行『add』、『edit』、『delete a file』，最後都需要執行 commit 的動作。
加入 commits 的過程，目的在於持續的追蹤你在該工作分支上的進度。

Commits 也同時建立一種透明的工作歷史流程，可以幫助他人了解你的方向與想法觀念。每一個 commit 都會有自己的 commit message，
commit message 的目的在於詳細解釋『到底做了什麼改變』。此外每個 commit 都是針對不同功能上的改變。這也可幫助你回朔到某個 commit 前的狀態，如果你發現了某些 commit 後產生一些 bug 或者決定在某個環節上在重新開啟一個新的分支，並且進行功能上的重構。

另外這邊講的 commit 應該是指，遞交代碼時上的 branch road map。透過視覺化的介面，與 message 得知整體專案的拓樸。

## ProTip

Commit message 是非常重要的一件事情（在 [code reviewed](http://maxdev.huder.link/2015/07/pre-merge-code-reviews.html) 有額外解釋）。特別是追蹤代碼上的變動與 push 到 server 上的顯示歷程。也因此乾淨、清楚的 commit messages 是非常重要的一件事，因為透過良好的習慣建立，可以讓你的夥伴更輕鬆的跟隨你的腳步，並且適時的提供一些回饋。
