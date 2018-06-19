- 在只有一個 cpu 時(可透過 runtime.GOMAXPROCS(1) 設定), 永遠是最後一個先執行, 剩下的按順序執行


```
package main

import "runtime"
import "fmt"

func init() {
  runtime.GOMAXPROCS(2)
}

func training(u string, done chan bool) {
  fmt.Println(u)
  done <- true
}

func main() {
  done := make(chan bool)

  values := []string{"a", "b", "c"}
  for _, v := range values {
    fmt.Println("--->", v)
    go training(v, done)
  }

  // wait for all goroutines to complete before exiting
  for range values {
    <-done
  }
}
```

- 可以確定的是，在迴圈中依序執行
	1. print a
	2. go training(a)
	3. print b
	4. go training(b)
	5. print c
	6. go training(c)
- 但因為多核的關係，無法判斷哪一個 goroutine 先執行，故輸出結果不一定
- 若是單核 runtime.GOMAXPROCS(1), 則固定輸出