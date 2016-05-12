# GitHub Flow（六）：Merge
[原文出處](https://guides.github.com/introduction/flow/)

## Merge

現在你的 branch 已經通過正式的產品部署測試，就是該將你的 code 合併到 master branch 當中。

一經合併後，Pull Requests 會將你代碼的所有歷史變更紀錄在 master 上。讓這些紀錄是可被搜尋的，讓所有人可以隨時的回顧去了解，『要這樣做的原因與理由』，畢竟代碼會隨著當下的狀況而有所變動，我們也常常遇到『前面的工程師怎麼寫得這麼糟糕』的評論，這個方式有助於我們了解當下這樣做的原因，也有可能20年前只有這種解法。

## ProTip

在 Pull Request 中透過某些關鍵字的整合，你可以透過該問題連結到該片段的語法。當你 Pull Request 被合併之後，相關的 issue 也將被關閉。
如，輸入搜尋 ```Closes #32``` 將會關閉 repository 中的 issue 32。
More info about [help article](https://help.github.com/articles/closing-issues-via-commit-messages)  