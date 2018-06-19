# 什麼是 channel

- go 用來儲存數據的管道，可從中塞入數據，取出數據。
- 命名規則
`arg := make(chan {type}, {channel_size})`

- 必須使用 make 創建
```
ci := make(chan int)
cs := make(chan string)
cf := make(chan interface{})
```

- channel 通過操作符 `<-` 來接收與發送數據
```
ch <- v    // 发送v到channel ch.
v := <-ch  // 从ch中接收数据，并赋值给v
```

- channel 的規則為先進先出


# 如何判斷 channel 裡面的任務數量
用 len()

ch := make(chan interface{})
fmt.Println(len(ch))

# 在 goutine 中用 channel
- 從 cahnnel 中取出時，會等待

# channel 沒有設定 size 情況(unbuffered channel)

- 若沒設定 size, 則只能用 ch<- 在 goroutine 中
- 否則會造成 crash

```
package main

import "fmt"

func main() {

  messages := make(chan string)

  go func() {
    messages <- "buffered" //會有deadlock，因為會停到直到跑到 <-messages
    messages <- "channel"  //會有deadlock，因為會停到直到跑到 <-messages
  }()

  fmt.Println(<-messages)
  fmt.Println(<-messages)
}
```