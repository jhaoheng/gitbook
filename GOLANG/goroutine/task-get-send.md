```
package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {
	jobs := make(chan int)
	var wg sync.WaitGroup
	go func() {
		time.Sleep(time.Second * 3)
		close(jobs)
	}()
	go func() {
		for i := 0; ; i++ {
			jobs <- i
			fmt.Println("produce:", i)
		}
	}()
	wg.Add(1)
	go func() {
		defer wg.Done()
		for i := range jobs {
			fmt.Println("consume:", i)
		}
	}()
	wg.Wait()
}
```