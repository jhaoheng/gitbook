# interface

> interface就是一組抽象方法的集合，它必須由其他非interface類型實現，而不能自我實現， Go通過interface實現了duck-typing:即"當看到一隻鳥走起來像鴨子、游泳起來像鴨子、叫起來也像鴨子，那麼這只鳥就可以被稱為鴨子"。

```
package main

import "fmt"

type Human struct {
  name  string
  age   int
  phone string
}

func (h Human) SayHi() {
  fmt.Printf("Hi, I am %s you can call me on %s\n", h.name, h.phone)
}

type Men interface {
  SayHi()
}

func main() {
  max := Human{name: "max", age: 10, phone: "XXXXXXXXXX"}

  //定义Men类型的变量i
  var i Men

  //i能存储Student
  i = max
  i.SayHi()
}
```

## 變數型態為 interface{}

```
// 定义a为空接口
var a interface{}
var i int = 5
s := "Hello world"
// a可以存储任意类型的数值
a = i
a = s
```


