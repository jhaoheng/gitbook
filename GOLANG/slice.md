# slice 

- slice 不需要指定大小
- 由三個元件構成
	- ptr
	- len
	- cap (capacity)

- 宣告 : `slice := make([]type, len)`
- 宣告一個 slice : `a := []int{}`
	- len & cap = 0
- 設定固定格式 : `a := make([]int,5,10)`
	- len=5, cap=10



## 不宣告長度的做法
```
var a []int
a = append(a, 1)
a = append(a, 2)

for i := range a {
fmt.Println(a[i])
}
```

`var a []int` 等同 `a := []int{}`
