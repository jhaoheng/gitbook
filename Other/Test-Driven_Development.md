## The TDD(Test-Driven Development)

因為一直都是接觸專案，開發上也有幾個，但有時無法體會 TDD 到底作用在哪，後來看到一句話，恍然大悟

> 『盡可能減少 GUI 的測試，這類測試不穩定，不易維護』


```
Over the years I have come to describe Test Driven Development in terms of three simple rules. They are:

1. You are not allowed to write any production code unless it is to make a failing unit test pass.
2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures.
3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

－The Three Laws of TDD, UncleBob 
```

1. 在寫產品代碼前，測試代碼要先行。	
	在開發產品前，我無法理解這件事情，原因是專案的流程上，用戶比較在乎的是 GUI 介面的呈現，以至於用戶今天想做 A，明天想做 B。
	但我想表達的是，多數的專案，其實多數處理的方法都很相似，多數的功能，都可以先準備起來，『穩定度』高，產品推行的也會快，這也是測試先行的概念之一，今天產品都會不斷的迭代，尤其是大量的修改代碼時，越細微（這裡指的是切分的功能上）的測試代碼，覆蓋率越高。
	
2. 當你測試時發生錯誤，不要再去攥寫更多的測試方法，修改你產品的 code 為第一要務。當然編譯錯誤也是一種錯誤。
	亦即不要一次開太多測試規格後，才去開發 production code，聚焦一個 unit test，不要企圖一次通過全部的測試。		
	一種需求，一個單元測試，一個 production code。
	
3. 每一行產品代碼，都是為了要通過單元測試。
	在開發產品時，切勿為了貪快，而同時處理多種規格問題，一種需求，只為了通過一個單元測試。baby step。
	開發人員常常為了，一次滿足多種需求，而忽略了單元測試的問題，其實多半與主管的時程 backlog 有很大的關聯，但用最少、最簡單、最直覺的方式來通過測試案例、滿足需求。而因為用最小的方式進行攥寫，以後重構也就較為方便許多。所以注意一點，所有的一切，都是預防未來產品過分龐大時，產生的落差。
	- 避免過度設計
	- 即時交付
	- 順手整理 production code 與 清理技術債








