## defer : 延遲的函數

> - defer 是在執行完return 後執行
> - defer 後進先執行

主要目的在於當處理某型動作與行為時，在前面加上 `defer` 可讓該行為延後執行
到什麼時候開始執行？當執行 return 時，會依照『後進先出』執行帶有 defer 的函示

example : 

```
func deferFunc() int {
    index := 0

    fc := func() {

        fmt.Println(index, "匿名函数1")
        index++

        defer func() {
            fmt.Println(index, "匿名函数1-1")
            index++
        }()
    }

    defer func() {
        fmt.Println(index, "匿名函数2")
        index++
    }()

    defer fc()

    return func() int {
        fmt.Println(index, "匿名函数3")
        index++
        return index
    }()
}

func main() {
    deferFunc()
}
```

結果 : 

```
0 匿名函数3
1 匿名函数1
2 匿名函数1-1
3 匿名函数2
```