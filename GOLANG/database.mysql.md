最好先定義 struct

如此一來就可以直接在 func 中，直接設定結構式，較為方便

>使用make，而不是直接使用var persons []Person的聲明方式。
>使用make的方式，當數組切片沒有元素的時候，Json會返回[]。
>如果直接聲明，json會返回null。


# database/sql

這是 golang 的標準庫之一，提供一系列的方法訪問 db

`go doc database/sql`

lib : `https://golang.org/pkg/database/sql`
中文 : `http://cngolib.com/database-sql.html`

# query, exec :lib 中有 範例

# 很好的 fetch 範例
http://www.cnblogs.com/hupengcool/p/4143238.html

# 更好的解法 rows -> json
func getJSON(sqlString string) (string, error) {
  rows, err := db.Query(sqlString)
  if err != nil {
      return "", err
  }
  defer rows.Close()
  columns, err := rows.Columns()
  if err != nil {
      return "", err
  }
  count := len(columns)
  tableData := make([]map[string]interface{}, 0)
  values := make([]interface{}, count)
  valuePtrs := make([]interface{}, count)
  for rows.Next() {
      for i := 0; i < count; i++ {
          valuePtrs[i] = &values[i]
      }
      rows.Scan(valuePtrs...)
      entry := make(map[string]interface{})
      for i, col := range columns {
          var v interface{}
          val := values[i]
          b, ok := val.([]byte)
          if ok {
              v = string(b)
          } else {
              v = val
          }
          entry[col] = v
      }
      tableData = append(tableData, entry)
  }
  jsonData, err := json.Marshal(tableData)
  if err != nil {
      return "", err
  }
  fmt.Println(string(jsonData))
  return string(jsonData), nil 
}