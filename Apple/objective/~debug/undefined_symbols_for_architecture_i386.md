## debug

```
會出現這樣的問題
應該是把 .m .h 檔案加入到專案裡的時候
add to targets 沒有勾選要加入的 target
所以記得加入的時候要勾
ref : http://stackoverflow.com/questions/6984368/undefined-symbols-for-architecture-i386-objc-class-skpsmtpmessage-refere

解決的方法
先點選專案（左邊 navigator 列表，點選專案的圖示）
選擇 target
選擇頁籤 Build Phases
Compile Source 沒有展開的話先點開
按加號
將這個 target 需要的 .m 都加入
如果只有一個 target 就把所有的 .m 檔放入
```