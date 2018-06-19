# Non-Blocking channel

> 在基本的 channel 下（設定size, buffered） 都是 blocking 的操作行為
> 在 select 下設定 default, 如此一來, select 就不會鎖住(等待 channel 的操作行為)
> 若有設定 select default 的操作，就不會發生 `fatal error: all goroutines are asleep - deadlock!`


```
package main

import "fmt"
import "time"

func main() {
  t1 := time.Now()

  messages := make(chan string)
  signals := make(chan bool)

  // Here's a non-blocking receive. If a value is
  // available on `messages` then `select` will take
  // the `<-messages` `case` with that value. If not
  // it will immediately take the `default` case.
  select {
  case msg := <-messages:
    fmt.Println("received message", msg)
  default:
    fmt.Println("no message received")
  }

  // A non-blocking send works similarly. Here `msg`
  // cannot be sent to the `messages` channel, because
  // the channel has no buffer and there is no receiver.
  // Therefore the `default` case is selected.
  msg := "hi"
  select {
  case messages <- msg:
    fmt.Println("sent message", msg)
  default:
    fmt.Println("no message sent")
  }

  // We can use multiple `case`s above the `default`
  // clause to implement a multi-way non-blocking
  // select. Here we attempt non-blocking receives
  // on both `messages` and `signals`.
  select {
  case msg := <-messages:
    fmt.Println("received message", msg)
  case sig := <-signals:
    fmt.Println("received signal", sig)
  default:
    fmt.Println("no activity")
  }

  t2 := time.Now()
  fmt.Println("消耗時間 : ", t2.Sub(t1))
}
```