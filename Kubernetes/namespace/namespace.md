# 哪些情況下適合使用多個 namespace

- 因為 namespace 可以提供獨立的命名空間, 因此可以實現部分的環境隔離. 當你的項目和人員眾多的時候可以考慮根據項目屬性, 例如 生產、測試、開發 等
- 在不同 namespace 下
	- 使用的 node 會相同
	- 建立的 pod/service 位置會因為 namespace 而不同, 所以若跑測試等一樣會消費到既有的 node 資源