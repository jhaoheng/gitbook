# fatal error: all goroutines are asleep - deadlock

主要原因是所有的 goroutine 都已經結束，但系統似乎還在等待某些事情發生，所造成的錯誤

example
```
package main

import "time"
import "fmt"

func waittime(timeout chan bool) {
  time.Sleep(5 * time.Second) // sleep one second
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

  for true {
    select {
    case msg := <-ch:
      fmt.Println(msg)
    case <-timeout:
      fmt.Println("timeout!")
    }
  }
}
```