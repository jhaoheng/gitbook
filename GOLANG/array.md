# 陣列 array

## 宣告

```
var a [5]int // 宣告一個大小 5 的 int array
=> [0 0 0 0 0]

var b []int // 宣告一個空的 int array
=> []

var c = [5]int{1,2,3,4,5} // 宣告一個大小 5 的 int array, 並給初始值
=> [1 2 3 4 5]

var d = []int{1,2,3,4,5}
=> [1 2 3 4 5]

var e = [7]int{1, 2, 3, 4, 5, 6}
=> [1 2 3 4 5 6 0]
```

# example 

```
var twoD [2][3]int
for i := 0; i < 2; i++ {
    for j := 0; j < 3; j++ {
        twoD[i][j] = i + j
    }
}
fmt.Println("2d: ", twoD)

for k, v := range twoD {
    fmt.Println(k, v)
}
```