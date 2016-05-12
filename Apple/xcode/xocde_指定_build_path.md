# 目的
讓每次的 workspace 中的 static lib / framework 的 header or lib path 都指到固定的位置  
如此只需設定好 workspace，lib 的 header 與該位置，就固定在 workspace 中的某個地方

# 設定方法

首先，一旦設定之後，每個『新』專案都會這樣跑

1. 開啟 xocde 上方的 navi bar，點開 Xcode -> preference -> Location -> Derived Data -> Advanced -> Legacy(selected)
2. 設定 project，TARGETS -> Build Settings -> Build Locations  
這欄位設定，預設是 build，只要你的 project 一旦建立起來，會在你目前資料夾的位置下，產生一個 build 的資料夾，其他子資料夾的名稱，就如這個欄位設定的一樣。