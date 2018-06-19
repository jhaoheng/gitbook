http://www.evanlin.com/go-channels-handle/

# 命名規則
```
arg := make(chan {type}, {channel_size})
go func(){
}()
```

# sample 1

```
import "fmt"

func main(){
     s := make(chan string) //宣告一個 channel 變數
     go func(){
        s <- "hello"           //寫入 channel (sender)
     }()
     val := <- s               //讀取 channel (receiver)
     fmt.Println(val)
}
```

1. 建立一個 goroutine  //此時 s <- "hello" 還沒執行
2. 執行 val := <- s   //s 空的, receiver ready (停住)
3. 執行 s <- "hello"  //sender 將訊息寫入 s, sender ready
4. val := <- s       //成功讀取 s, (因為 receiver, sender 都 ready)
5. fmt.Println(val)

# sample 2

```
import "fmt"

func main(){
     s := make(chan string)
     go func() {
          for i := 0; i < 3; i++ {
               fmt.Println("sender hello",i)
               s <- fmt.Sprintf("receiver hello %d", i)
          }
     }()

     for i := 0; i < 3; i++ {
          val := <-s
          fmt.Println(val)
     }
}
```

1. 建立一個 goroutine 
2. 執行 val := <- s          //s 空的, receiver ready (停住)
[sender hello 0]
3. 執行 s <- fmt.Sprintf..   //sender 將訊息寫入 s, 傳訊成功
[sender hello 1]
4. 執行 s <- fmt.Sprintf..   //s 有值, sender ready(停住)
5. val := <-s               //讀到 s 的值
[receiver hello 0]
6. val := <-s               //s 空的, receiver ready, 傳訊成功
[receiver hello 1]
7. val := <-s               //s 空的, receiver ready (停住)
[sender hello 2]
8. 執行 s <- fmt.Sprintf..   //sender 將訊息寫入 s, 傳訊成功
9. val := <-s               //讀到 s 的值
[sender hello 2]


# sample 3 : 利用channel來回傳結果
```
package main

import "fmt"

func main() {
    c := make(chan int)

    go func() {
        //在Go Routine中處理
        if false {
            c <- 0 //or other invalid value
            return
        }
        result := 2
        c <- result
    }()

    // 這樣就不會變成無窮等待
    result := <-c
    if result > 0 {
        totalResult := result*3 + 5
        fmt.Printf("result is %d", totalResult)

    }
}
```