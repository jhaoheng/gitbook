# select

- 可以分派處理多個需求
- select 與 switch 雷同
- select 主要是針對 I/O 的操作
- select 會等待 I/O 事情發生後，執行某件事情

## 利用 select 等待 goruntine 的通知，並且執行某些事情

輸出順率為
順序 :  1 ,  5
順序 :  2 ,  timeout!
順序 :  3 ,  timeout!
順序 :  4 ,  timeout!

```
package main

import "time"
import "fmt"

func waittime(timeout chan bool) {
  time.Sleep(2 * time.Second) // sleep one second
  timeout <- true
}

func insert(ch chan int) {
  ch <- 5
}

func main() {
  timeout := make(chan bool, 1)
  go waittime(timeout)

  ch := make(chan int)
  go insert(ch)

  i := 0
  for true {
    i++
    select {
    case msg := <-ch:
      fmt.Println("順序 : ", i, ", ", msg)
    case <-timeout:
      fmt.Println("順序 : ", i, ", ", "timeout!")
      go waittime(timeout)
    }
  }
}
```

## 利用 select 判斷 channel 是否已滿

```
ch := make (chan int, 1)
ch <- 1
select {
case ch <- 2:
default:
    fmt.Println("channel is full !")
}
```

## 利用 select 判斷速度快慢執行哪個 func
```
package main

import "time"
import "fmt"

func main() {

  t1 := time.Now()

  c1 := make(chan string, 1)
  go func() {
    time.Sleep(time.Second * 0)
    c1 <- "result 1"
  }()

  select {
  case res := <-c1:
    fmt.Println(res)
  case <-time.After(time.Second * 1):
    fmt.Println("timeout 1")
  }

  t2 := time.Now()
  fmt.Println("消耗時間 : ", t2.Sub(t1))
}
```
## 檢查channel有沒有設定過


```
package main

import "time"
import "fmt"
import "runtime"

func init() {
  runtime.GOMAXPROCS(2)
}

func main() {

  t1 := time.Now()

  c1 := make(chan string, 1)

  if true {
    go func() {
      runtime.Gosched()
      c1 <- "result 1"
    }()
  }
  time.Sleep(time.Second * 2) <----- 設定秒數, 等待 go func 執行完畢

  select {
  case x, ok := <-c1: //如果someCondition == true 除非這時候剛好得到結果，不然跑不到．
    if ok {
      fmt.Printf("Value %s was read.\n", x)
    } else {
      fmt.Println("Channel closed!") //Channel 被close.
    }
  default:
    fmt.Println("No value ready, moving on.") //Channel 沒有設定過，會馬上離開....
  }

  t2 := time.Now()
  fmt.Println(t2.Sub(t1))
}
```
