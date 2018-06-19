# function

## basic type

```
func {func_name} ( {arg_name} {arg_type}, ... ) {return type} {

}
```

## basic example

```
func foo (name string) {
	fmt.Println("Hi " + name)
}
```

## func 多個傳入值

```
func foo( name1 string, name2 string) {
	fmt.Println("Hi " + name1 + ", " + name2)
}

# 相同的格式，可以寫成一行 (name1, name2 string)
```

## func return : 如果有 return 的參數，在 func 的位置，一定要加入 return 的參數型態 

```
func foo (name string) string {
	var str = "Hi " + name
	return str
}
```

## func return : 命名規則，可在 func 中，直接命名回傳的參數名稱

```
func foo (name string) (str string) {
	str = "Hi " + name
	return
}
```

## func 多個 return

```
func foo (x, y int) (int, int) {
	return x+y, x-y
}
```

## func 多個傳入參數，不確定數量

```
func foo (x ...int) int {
	var t int
	for _, n := range x {
		t += n
	}
	return t
}
```

## func , 矩陣為參數傳入

```
func foo (x []int) int {
	var t int
	for _, n := range x {
		t += n
	}
	return t
}
```

## func 當成變數宣告

```
foo := func() {
	fmt.Println("Hi")
}
```

## func 回傳 func

```
func foo () func () string {
	return func () string {
		return "string"
	}
}
```

## callback : 在執行 func_b 時，又回去 func_a 中執行

```
package main

import "fmt"

func visit(friends []string, callback func(string)) {
    for _, n := range friends {
        callback(n)
    }
}

func main() {
    visit([]string{"Tina", "James", "Mary"}, func(n string) {
        fmt.Println(n)
        fmt.Println("test")
        fmt.Println("test2")

    })
}

# output
Tina
test
test2
James
test
test2
Mary
test
test2
```

## recursion 遞迴

```
package main

import "fmt"

func double(x int) int {
    x = x * 2
    if x > 64 {
        return x
    }
    return double(x)
}

func main() {
    fmt.Println(double(5))
}
```

## defer : 整個function結束後才會執行

```
package main

import "fmt"

func hello() {
    defer fmt.Println("Nice to meet you")
    fmt.Println("Hello Tina")
}

func main() {
    hello()
}

#output
Hello Tina
Nice to meet you
```

## 傳指標(pass-by-pointer) : Go像C語言一樣有指標的概念，同樣可以傳遞

```
package main 

import "fmt"

func change(x *string) {
    *x = "Tom"
}

func main() {
    name := "Troy"
    fmt.Println(&name) // name的記憶體位置
    
    change(&name) // 傳記憶體位置
    
    fmt.Println(&name) // 記憶體位置不變
    fmt.Println(name) // 但內容有變
}
```


## func 中 結構(struct) 當作參數

```
package main

import "fmt"

type stuff struct {
    name  string
    price int
}

func main() {
    p := stuff{"pancil", 10}
    fmt.Println(p.price)
    inprice(&p)
    fmt.Println(p.price)
}
    
    
func inprice(s *stuff) {
    s.price += 10
}
```

## 自己宣告 func, 同時執行 : 記得function宣告完後要加()代表執行的意思

```
package main

import "fmt"

func main() {
    func() {
        fmt.Println("lalala")
    }()
}
```
