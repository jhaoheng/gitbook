利用 任務接收，任務執行 來表達執行的順序與執行速度

```
package main

import "fmt"
import "runtime"
import "time"

func init() {
  runtime.GOMAXPROCS(2)
}

func do(task chan int) {
  // runtime.Gosched()
  fmt.Println("do task : ", <-task)
}

func main() {
  t1 := time.Now()
  task := make(chan int, 10)

  i := 0
  for i = 0; i < 99; i++ {
    fmt.Println("get task : ", i, ", current task have : ", len(task))
    task <- i
    go do(task)

    // select {
    // case task <- i:
    //   fmt.Println("get task : ", i, ", current task have : ", len(task))
    //   go do(task)
    // default:
    //   fmt.Println("channel is full !")
    // }
  }
  t2 := time.Now()
  fmt.Println("消耗时间：", t2.Sub(t1), "秒")
  fmt.Scanln()
}
```