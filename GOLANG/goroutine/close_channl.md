# close channel
> Closing a channel indicates that no more values will be sent on it. 
> 關閉 channel 意思就是沒有直需要被送進去
> This can be useful to communicate completion to the channel’s receivers.
> 有效的告訴 channel 不需要再去接收值, 一但 channel 被關閉, 所有的 `channel<-` 都會被關閉

- 使用 close() 函式, 進行正式關閉 channel
- 第一個 go func 執行迴圈, 等待 jobs 將值丟出來 (利用 channel 同步的方式), 此為另一個線程
- 下面的 for 迴圈，在執行三個設定到 jobs 的值後，關閉 jobs
	- 因為關閉 jobs, 所以第一個 go func 的 channel sync 的等待就會被關閉, more = false
	- more=false, done 就會被賦予 true
- 透過利用 channel sync 的功能，等待 done 被賦予參數

```
package main

import "fmt"

// In this example we'll use a `jobs` channel to
// communicate work to be done from the `main()` goroutine
// to a worker goroutine. When we have no more jobs for
// the worker we'll `close` the `jobs` channel.
func main() {
  jobs := make(chan int, 5)
  done := make(chan bool)

  // Here's the worker goroutine. It repeatedly receives
  // from `jobs` with `j, more := <-jobs`. In this
  // special 2-value form of receive, the `more` value
  // will be `false` if `jobs` has been `close`d and all
  // values in the channel have already been received.
  // We use this to notify on `done` when we've worked
  // all our jobs.
  go func() {
    for {
      j, more := <-jobs
      // fmt.Println("test : ", j, more)
      if more {
        fmt.Println("received job", j)
      } else {
        fmt.Println("received all jobs")
        done <- true
        return
      }
    }
  }()

  // This sends 3 jobs to the worker over the `jobs`
  // channel, then closes it.
  for j := 1; j <= 3; j++ {
    jobs <- j
    fmt.Println("sent job", j)
  }
  close(jobs)
  fmt.Println("sent all jobs")

  // We await the worker using the
  // [synchronization](channel-synchronization) approach
  // we saw earlier.
  <-done
}
```

# close and range
在 range 中使用 channel 來迭代所有的內容, 若沒有關閉, 會造成 deadbolck
因 range 會認為 channel 是一個無限的內容保存器
一但用了 close(channel), channel 就不會在接收值

> This example also showed that it’s possible to close a non-empty channel but still have the remaining values be received.
> 這個範例也表示, close 可以關閉一個不是空的 channel, 但仍然會保留已經被接收的參數

```
package main

import (
  "fmt"
)

func main() {
  ch := make(chan string, 2)
  ch <- "one"
  ch <- "two"

  fmt.Println(ch)
  fmt.Println(<-ch)
  close(ch)

  for v := range ch {
    fmt.Println(v)
  }
}
```




