# git describe

## 使用方法

- ```git describe <ref>```
	- <ref> 是任何一個可以被 git 解讀的 commit 的位置，若無指定，則以目前 HEAD 所在位置為準。

- 輸出的內容，```<tag>_<numCommits>_g<hash>```
	- <tag>：表示離 <ref> 最近的 tag
	- <numCommits>：表示這個 tag 離 <ref> 間，有多少個 commit
	- <hash>：表示 commit 的前七個 id

## 目的＆使用方向

當你對目前的 git branch 方向有點搞不清楚時，包含你透過 git bisect 進行正確版本回朔，或者使用別人的電腦，或者想了解目前同事攥寫的狀況
，可用 git describe 幫助你瞭解，目前離最近的 tag 差了多少個 commit。 