https://olddocs.phalconphp.com/zh/latest/reference/loader.html


# 如何設定 loader

1. 檢查 loader.php 有無把 dir 路徑放入
2. 在 dir 路徑中的 folder 中，加入 Test.php，記得要大寫
3. 在 Test.php 中的 class 的名稱，也要叫 Test
4. 在 xxx.php 執行 Test class 的方式為 : `new \Test();`