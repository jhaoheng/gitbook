`go doc json` : The mapping between JSON and Go values is described in the
documentation for the Marshal and Unmarshal functions.

```
import (
	"encoding/json"
)
```

## 很好的範例
http://lolikitty.pixnet.net/blog/post/129844768-golang-%2C-go-%E8%AA%9E%E8%A8%80-%E5%85%A5%E9%96%80%EF%BC%9Ajson-%E7%B7%A8%E7%A2%BC---%E8%A7%A3%E7%A2%BC

# json 在直接設定 soruce 時，必須用 ` 包圍

```
src_json := []byte(`{"name":"max", "age":12, "is_success":true}`)
```

# unmarshal 時

## 使用 struct 的物件中的各項名稱，開頭需大寫

```
type user struct {
    Name string
    Age  int
    Male bool
}
src_json := []byte(`{"name":"max", "age":12, "male":true}`)
u := user{}
err := json.Unmarshal(src_json, &u)
if err != nil {
    panic(err)
}
fmt.Println(u)
```

# 不使用 struct, 使用 interface{}



# Encoding

To encode JSON data we use the Marshal function.
`func Marshal(v interface{}) ([]byte, error)`

```
type Message struct {
    Name string
    Body string
    Time int64
}
m := Message{"Alice", "Hello", 1294706395881547000}
b, err := json.Marshal(m)

# If all is well, err will be nil and b will be a []byte containing this JSON data:
b == []byte(`{"Name":"Alice","Body":"Hello","Time":1294706395881547000}`)
```

# Decoding

To decode JSON data we use the Unmarshal function.
`func Unmarshal(data []byte, v interface{}) error`

```
var m Message
err := json.Unmarshal(b, &m)
```

# tag ref

- omitempty : tag中如果帶有"omitempty"選項，那麼如果該字段值為空，就不會輸出到JSON串中

- 字段的tag是"-"，那麼這個字段不會輸出到JSON
- tag中帶有自定義名稱，那麼這個自定義名稱會出現在JSON的字段名中，例如上面例子中serverName
- tag中如果帶有"omitempty"選項，那麼如果該字段值為空，就不會輸出到JSON串中
- 如果字段類型是bool, string, int, int64等，而tag中帶有",string"選項，那麼這個字段在輸出到JSON的時候會把該字段對應的值轉換成JSON字符串


```
type Server struct {
	// ID 不会导出到JSON中
	ID int `json:"-"`

	// ServerName2 的值会进行二次JSON编码
	ServerName  string `json:"serverName"`
	ServerName2 string `json:"serverName2,string"`

	// 如果 ServerIP 为空，则不输出到JSON串中
	ServerIP   string `json:"serverIP,omitempty"`
}
```
