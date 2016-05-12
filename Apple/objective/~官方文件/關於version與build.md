https://developer.apple.com/library/tvos/documentation/IDEs/Conceptual/AppDistributionGuide/ConfiguringYourApp/ConfiguringYourApp.html#//apple_ref/doc/uid/TP40012582-CH28-SW18

## Setting the Version Number and Build String

xcode 中  

- version : 4.5.2，第一個數字代表主要修訂版本，第二個代表次要修訂版本，第三個代表的是維護的修訂版本。
- build : released or unreleased，的版本號

[Version Numbers and Build Numbers](https://developer.apple.com/library/ios/technotes/tn2420/_index.html)

根據此文章的解釋，version 是會出現在 itunes connect 中的版本號，而 build 則是，你可能會有幾個相同的版本號，但卻 build for 某一件事情。  
所以或許可以代表 build for debug / release / adhoc ... 等等，或者當你的版本相同，只是忽略了 icon 或者某些圖片的更新，或者其他原因，code 沒變更，但只是某些 bundle 忘記設定，而重新 build 一次的版本號。  

所以基本上，build 的號碼，會多於 version 的號碼

養成好習慣，就可以容易的區分版本問題