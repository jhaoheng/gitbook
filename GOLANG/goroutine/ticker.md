# ticker
> https://golang.org/pkg/time/#Ticker
> ticker 若無停止，就會不斷將 time tick 送入 channel 中
> 使用 Stop() 來停止 ticker 的計算


```
package main

import "time"
import "fmt"

func main() {
  t1 := time.Now()

  ticker := time.NewTicker(500 * time.Millisecond) // 每 0.5s 發送一次 time tick 到 channel 中

  go func() {
    for t := range ticker.C {
      fmt.Println("Tick at", t)
    }
  }()

  // 等待 1.6 秒後關閉 ticker
  time.Sleep(1600 * time.Millisecond)
  ticker.Stop() // 停止 time tick

  t2 := time.Now()
  fmt.Println(t2.Sub(t1))

}
```