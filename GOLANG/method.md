# method

類型(type)可設定方法(method)，進行呼叫

> "A method is a function with an implicit first argument, called a receiver."
> func (r ReceiverType) funcName(parameters) (results)

- 雖然method的名字一模一樣，但是如果接收者不一樣，那麼method就不一樣
- method裡面可以訪問接收者的字段
- 調用method通過.訪問，就像struct裡面訪問字段一樣

以下的 area() 可以算是各個類型延伸的方法

```
package main

import (
	"fmt"
	"math"
)

type Rectangle struct {
	width, height float64
}

type Circle struct {
	radius float64
}

func (r Rectangle) area() float64 {
	return r.width*r.height
}

func (c Circle) area() float64 {
	return c.radius * c.radius * math.Pi
}


func main() {
	r1 := Rectangle{12, 2}
	r2 := Rectangle{9, 4}
	c1 := Circle{10}
	c2 := Circle{25}

	fmt.Println("Area of r1 is: ", r1.area())
	fmt.Println("Area of r2 is: ", r2.area())
	fmt.Println("Area of c1 is: ", c1.area())
	fmt.Println("Area of c2 is: ", c2.area())
}
```