透過利用 `<-ch` 的方式，進行同步等待 goroutine 執行完畢

```
package main

import "fmt"

func sum(a []int, c chan int) {
  total := 0
  for _, v := range a {
    total += v
  }
  c <- total // send total to c
}

func do(c chan bool) {
  fmt.Println("do something....")
  c <- true
}

func send(messages chan string) {
  messages <- "buffered"
  messages <- "channel"
}

func main() {
  c := make(chan bool, 1)
  go do(c)
  if <-c {

    messages := make(chan string)
    go send(messages)
    fmt.Println(<-messages)
    fmt.Println(<-messages)
  }

  fmt.Scanln()
}
```

這邊使用 chan : c 來判斷是否回傳 true / false, 後，執行下一個 goroutine
輸出為
```
do something....
buffered
channel
```

若拿掉 if, 則無法預測誰先誰後
