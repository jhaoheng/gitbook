# 設定方法

> phalcon 3.0.x

> 前提，在 loader 中，使用 registerDirs 進行註冊

1. 檔名開頭不一定要大寫
2. 不能有 _ 符號
3. 檔名與 class 名稱要相同
4. 使用 class 時，方式為 
  - `$some = new \Some();`
  - `$some->funcname();`
5. 直接使用 function(), 規則
  - function 名稱可以有底線
  - 一定要有一個 class 類別 ... 但 function 在 class 類別之外
  - `$some = new \Some();`
  - `function();`