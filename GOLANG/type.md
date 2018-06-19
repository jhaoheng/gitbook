## 定義新的型態
type double float64 


## example

```
type ages int # 用 age 代替了 int
 
type money float32 # 用 money 代替了 float32

type months map[string]int # 用 months 代替了 map[string]int 的類型

# 所以可以這樣用
m := months {
	"January":31,
	"February":28,
	...
	"December":31,
}
```