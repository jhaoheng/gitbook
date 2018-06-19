 
# 建立一個 mysql-連線 物件模型
  
`$conn = $app->di->get("mysql");`

# 將臨時物件放入 di 中

`$di = $app->di;`
`$di->set("max", $conn);`

# 從 di 中取出實例
`$conn2 = $di->get("max");`

# 驗證 di 中是否有此物件
`$di->has("max2")`

# 測試

```
  $conn = $app->di->get("mysql");

  $di = $app->di;
  $di->set("max", $conn);

  if ($di->has("max")) {
    echo "有此服務";
  }
  else {
    echo "無此服務";
  }

  $di->remove("max");
  if ($di->has("max")) {
    echo "有此服務";
  }
  else {
    echo "無此服務";
  }
```