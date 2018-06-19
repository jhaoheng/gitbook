http://gotaly.blog.51cto.com/8861157/1405754

```
import (
	"log"
)
```


Print | Printf | Println
Fatal | Fatalf | Fatalln
Panic | Panicf | Panicln

Print   : 輸出對象而不用給定特別的標誌符號
Printf  : 即可以用C系列的格式化標誌表示輸出對象的類型，具體類型表示 可以參考 fmt.Printf 的文檔 
Println : 和log.Print基本一致，僅僅是在輸出的時候多輸出一個換行

example
```
package main
import (
    "log"
)
func main() {
    arr := []int{2, 3}
    log.Print("Print array ", arr, "\n")
    log.Println("Println array", arr)
    log.Printf("Printf array with item [%d,%d]\n", arr[0], arr[1])
    
    
    
	log.Println("println")
	log.Fatalln("fatalln")
	log.Panicln("panicln")
}
```


## example

```
package main
import (
    "encoding/json"
    "fmt"
)
type user struct {
    Name    string
    Age     int
    Married bool
}
func main() {
    src_json := []byte(`{"Name":"柏崎星奈","Age":16,"Married":false}`)
    u := user{}
    err := json.Unmarshal(src_json, &u)
    if err != nil {
        panic(err)
    }
    fmt.Println("Name: ", u.Name)
    fmt.Println("Age: ", u.Age)
    fmt.Println("Married: ", u.Married)
}

## 執行結果
panic: invalid character '1' looking for beginning of object key string

goroutine 1 [running]:
main.main()
	/Users/maxhu/Documents/GOPATH/src/application/test/main.go:19 +0x2b1
exit status 2
```