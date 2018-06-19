# 範例應用
建立多個 worker
收到的任務送到 worker 中


```
package main

import "time"
import "fmt"

/*
worker ...
在 jobs 中取得任務
*/
func worker(workerNumber int, jobs <-chan int, results chan<- int) {
  for j := range jobs {
    fmt.Println("Worker number is : ", workerNumber, ", started  job", j)
    time.Sleep(time.Second)
    fmt.Println("Worker number is : ", workerNumber, ", finished job", j)
    results <- j * 2
  }
}

func main() {

  t1 := time.Now()

  // 建立兩種 channel
  jobs := make(chan int, 100)
  results := make(chan int, 100)

  // 開啟三個 worker 在 goroutine. 因 channel 在等待參數, 所以一開始狀態是 blocked
  // 將 workerNumber 設定成 1, 得到最後的消耗時間會所有不同
  maxWorker := 5
  fmt.Println("Worker 數量 : ", maxWorker)
  for workerNumber := 1; workerNumber <= maxWorker; workerNumber++ {
    go worker(workerNumber, jobs, results)
  }

  // 送入要執行的任務
  for j := 1; j <= 5; j++ {
    jobs <- j
  }
  close(jobs) // 關閉 jobs, 目的在於關閉背後的 goroutine

  // 等待, 取得結果參數, 跟送進去的 jon 數量有關
  for a := 1; a <= 5; a++ {
    <-results
  }

  t2 := time.Now()
  fmt.Println("消耗時間 : ", t2.Sub(t1))
}
```