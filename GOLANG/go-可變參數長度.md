> 透過可變參數長度, 可帶入非固定的變數數量


以下為帶入的參數均為 int 類型
```
func max(arg ...int) {
  fmt.Println(arg)
  fmt.Println(arg[0])
}

func main() {

  a := 5
  b := 6
  max(a, b)
}
```