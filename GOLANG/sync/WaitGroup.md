# waitgroup

> waitgroup 是一個 goroutine 任務的 單位數量化, 若需要增加一個 goroutine 就增加一個 waitgroup index, Add(). 當做完一個 goroutine 時, 就減少一個數量, Done(). 而 Wait() 的呼叫, 會讓整個 process 等待所有任務一起完成.
> 有點像是在一定時間內, 塞入 n 個任務, 讓 goroutine 執行, 而最後用 wati() 進行同步等待所有任務完成.
> 其實這跟 channel sync 相似

## ex1
```
package main

import (
  "fmt"
  "sync"
)

var waitgroup sync.WaitGroup

func test(shownum int) {
  fmt.Println(shownum)
  waitgroup.Done() //任務完成，將任務隊列中的任務數量-1，其實.Done就是.Add(-1)
}

func main() {
  for i := 0; i < 10; i++ {
    waitgroup.Add(1) //每創建一個goroutine，就把任務隊列中任務的數量+1
    go test(i)
  }
  waitgroup.Wait() //.Wait()這裡會發生阻塞，直到隊列中所有的任務結束就會解除阻塞
  fmt.Println("done!")
}
```

## ex2
```
package main

import (
  "fmt"
  "net/http"
  "sync"
)

func main() {
  var wg sync.WaitGroup
  var urls = []string{
    "http://www.golang.org/",
    "http://www.google.com/",
    "http://www.somestupidname.com/",
  }
  for _, url := range urls {
    // Increment the WaitGroup counter.
    wg.Add(1)
    // Launch a goroutine to fetch the URL.
    go func(url string) {
      // Decrement the counter when the goroutine completes.
      defer wg.Done()
      // Fetch the URL.
      resp, _ := http.Get(url)
      fmt.Println(url, resp.Status)
    }(url)
  }
  // Wait for all HTTP fetches to complete.
  wg.Wait()
}
```