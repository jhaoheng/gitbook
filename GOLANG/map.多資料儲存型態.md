# 多資料型結構

## [{}]
```
datas := []map[string]interface{}{
    0: {
      "vhost":        "vhost",
      "app":          "app",
      "stream":       "stream",
      "ts_file_name": "1571943563546.ts",
      "duration":     5.1,
    },
  }
```

## {{}}
```
test := map[int]map[string]interface{}{
	0: {
	  "vhost":        "vhost",
	  "app":          "app",
	  "stream":       "stream",
	  "ts_file_name": "1571943563546.ts",
	  "duration":     5.1,
	},
}
```

# map

Declaration and Initialization : `map [ KeyType ] ValueType`

- 基本
```
# 先宣告
var m1 map[string]string
# 使用 make 創建空間
m1 = make(map[string]string)
# 賦值
m1["a"] = "aa"
m1["b"] = "bb"
```

- 直接初始化
```
m1 := make(map[string]string)
m1["a"] = "aa"
m1["b"] = "bb"
```

- 初始化＋賦值 : 這個要注意 `1. 不需要 make` , `2. 參數的命名方式` , `3. 參數的賦值都要在結尾附加一個逗點`
```
m1 := map[string] string{
	"a":"aa",
	"b":"bb",
}
m1["c"]="cc"
```

必須用 make() 宣告 map
須事先定義 鍵名、鍵值 的資料型態

```
data := make( map[string] string )
data["username"] = "name"
data["password"] = "pass"
fmt.Println(data["username"])
```

# 設定多種類型

```
m := map[string]interface{}{
      "Name": "小鳩",
      "Age": 12,
      "Doll": []interface{}{
             "Cat",
             "Bear",
             "Rabbit",
      },
}
```

```
m1 := make(map[string]interface{})
m1["Name"] = "max"
m1["Age"] = 12
fmt.Println(m1["Age"])
```

# map to json

```
package main
import (
    "encoding/json"
    "fmt"
)
func main() {
    m := map[string]interface{}{
        "Name": "小鳩",
        "Age":  12,
        "Doll": []interface{}{
            "Cat",
            "Bear",
            "Rabbit",
        },
    }

    b, _ := json.Marshal(m)
    fmt.Println(string(b))
}
```

# 與 if else 使用方法

```
if v, ok:=m1["a"]; ok {
	fmt.Println(v)
} else {
	fmt.Println("no find key")
}
```

# for 迴圈上的使用

```
for k, v := range m1 {
	fmt.Println(k, v)
}
```

# 讀取
```
if v, ok := m1["a"]; ok {
	fmt.Println(v)
} else {
	fmt.Println("Key Not Found")
}
```

# 刪除

The delete function doesn't return anything, and will do nothing if the specified key doesn't exist.
```
delete({map object}, "{key}")
```

# 無此 key，設定 true/false
- i, ok := m["route"]
	- 如果 m := make(map[string] string) : i=""
	- 如果 m := make(map[string] int) : i=0
- 測試 key 是否存在 : `_, ok := m["route"]`

# 遍歷
```
for k, v := range m1 {
	fmt.Println(k, v)
}
```

# 並行讀取 / 寫入

> 此 code 會產生 => fatal error: concurrent map writes, 併發訪問map是不安全的，會出現未定義行為，導致程序退出。=> 使用 goroutines 優化同步的功能

```
package main
func main() {
    Map := make(map[int]int)
    for i := 0; i < 10; i++ {
        go writeMap(Map, i, i)
        go readMap(Map, i)
    }
}
func readMap(Map map[int]int, key int) int {
    return Map[key]
}
func writeMap(Map map[int]int, key int, value int) {
    Map[key] = value
}
```

## 解法 : 並行讀取 / 寫入 

> 官方
> Maps are not safe for concurrent use: it's not defined what happens when you read and write to them simultaneously. If you need to read from and write to a map from concurrently executing **goroutines**, the accesses must be mediated by some kind of synchronization mechanism. One common way to protect maps is with sync.RWMutex.

- 但是通過讀寫鎖控制map的併發訪問時，會導致一定的性能問題，不過能保證程序的安全運行，犧牲點性能問題是可以的。

```
package main
import (
    "fmt"
    "sync"
)
type SafeMap struct {
    sync.RWMutex
    Map map[int]int
}
func main() {
    safeMap := newSafeMap(10)
    for i := 0; i < 10; i++ {
        go safeMap.writeMap(i, i)
        go safeMap.readMap(i)
    }
    fmt.Println(safeMap.Map)
}

func newSafeMap(size int) *SafeMap {
    sm := new(SafeMap)
    sm.Map = make(map[int]int)
    return sm
}

func (sm *SafeMap) readMap(key int) int {
    sm.RLock()
    value := sm.Map[key]
    sm.RUnlock()
    return value
}

func (sm *SafeMap) writeMap(key int, value int) {
    sm.Lock()
    sm.Map[key] = value
    sm.Unlock()
}
```