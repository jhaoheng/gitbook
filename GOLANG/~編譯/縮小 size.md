https://blog.filippo.io/shrink-your-go-binaries-with-this-one-weird-trick/


## ex

``` test.go
package main

func TheHitchhikersGuideToTheGalaxy() {
  panic("DO NOT PANIC")
}

func main() {
  TheHitchhikersGuideToTheGalaxy()
}
```

``` cmd
基本 : env GOOS=linux GOARCH=arm GOARM=7 go build test.go
縮小 size : env GOOS=linux GOARCH=arm GOARM=7 go build -ldflags '-s -w' test.go 
```

> 降低 size 從 880k -> 588k