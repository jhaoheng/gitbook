```
// <em>[Rate limiting](http://en.wikipedia.org/wiki/Rate_limiting)</em>
// is an important mechanism for controlling resource
// utilization and maintaining quality of service. Go
// elegantly supports rate limiting with goroutines,
// channels, and [tickers](tickers).

package main

import "time"
import "fmt"

func main() {

  // First we'll look at basic rate limiting. Suppose
  // we want to limit our handling of incoming requests.
  // We'll serve these requests off a channel of the
  // same name.
  requests := make(chan int, 5)
  for i := 1; i <= 5; i++ {
    requests <- i
  }
  close(requests)

  // This `limiter` channel will receive a value
  // every 200 milliseconds. This is the regulator in
  // our rate limiting scheme.
  limiter := time.Tick(200 * time.Millisecond) // Tick() 不用特別進行關閉

  // By blocking on a receive from the `limiter` channel
  // before serving each request, we limit ourselves to
  // 1 request every 200 milliseconds.
  for req := range requests {
    <-limiter
    fmt.Println("request", req, time.Now())
  }

  // 利用 channel 的特性, 進行 blocked, 每 request 就將 channel 的 value 取出
  // 當 channel = 0 時, 會每 0.2 秒, 才會讓 channel sync 解鎖
  burstyLimiter := make(chan time.Time, 3)

  // 填滿 channel, 來讓 request 無需等待
  for i := 0; i < 3; i++ {
    burstyLimiter <- time.Now()
  }

  // 每 0.2s 將 burstyLimiter 新增參數, 最高到 3 個, 塞滿後就不會再新增
  // 等到需要新增時, 當下就會需要耗損 0.2 秒的緩衝時間, 所以最快允許三個進行加速處理
  go func() {
    i := 0
    for t := range time.Tick(2000 * time.Millisecond) {
      burstyLimiter <- t // 因 channel 被 blocked, 故除非 <-burstyLimiter, 否則不會繼續下去
    }
  }()
  // close(burstyLimiter) // 關閉 burstyLimiter 會造成 goruntine 停止運作

  // Now simulate 5 more incoming requests. The first
  // 3 of these will benefit from the burst capability
  // of `burstyLimiter`.
  burstyRequests := make(chan int, 5)
  for i := 1; i <= 5; i++ {
    burstyRequests <- i
  }
  close(burstyRequests)
  for req := range burstyRequests {
    <-burstyLimiter //(channel sync)等待釋放 blocked, 無法立即 print
    fmt.Println("request", req, time.Now())
  }

  fmt.Scanln()
}

```