# Taint & Toleration
> https://jimmysong.io/kubernetes-handbook/concepts/taint-and-toleration.html

- Taint 和 toleration 相互配合，可以用來避免 pod 被分配到不合適的節點上。每個節點上都可以應用一個或多個 taint ，這表示對於那些不能容忍這些 taint 的 pod，是不會被該節點接受的。如果將 toleration 應用於 pod 上，則表示這些 pod 可以（但不要求）被調度到具有相應 taint 的節點上。

- 其目的是優化 pod 在集群間的調度，這跟節點親和性類似，只不過它們作用的方式相反，具有 taint 的 node 和 pod 是互斥關係，而具有節點親和性關係的 node 和 pod 是相吸的。另外還有可以給 node 節點設置 label，通過給 pod 設置 nodeSelector 將 pod 調度到具有匹配標籤的節點上。