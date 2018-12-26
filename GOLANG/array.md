# 陣列 array

## 空陣列
var udplist []string = make([]string, 0)

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

# 從陣列新增一筆新資料

```
s = append(s, 0)
```

# 判斷陣列中是否存在某值

必須用 for 迴圈

// check item exist in array or not
	itemExist := false
	for _, v := range udps {
		if v == UDPIP {
			itemExist = true
		}
	}
	if itemExist == false {
		udps = append(udps, UDPIP)
	} else {
		return false
	}