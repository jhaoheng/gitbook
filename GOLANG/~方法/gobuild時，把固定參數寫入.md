1. go code

```
package main

import "fmt"

var minversion string

func main() {
	fmt.Println(minversion)
}
```

2. go build -ldflags "-X main.minversion=`date -u +%Y%m%d-%H:%M:%S`" main.go 
	- 會把 main.minversion 的參數『固定』成當下的時間
3. 執行 ./main.go, 會顯示出當下的版本

# 與 verion 合併使用

> https://www.zybuluo.com/aliasliyu4/note/654661

```
version := flag.Bool("v", false, "prints current version")
flag.Parse()
if *version {
	fmt.Println(minversion)
	// os.Exit(0)
}
```

# 若非 main 的參數

> -ldflags "-X app/config.version=${VERSION} -X main.build=${BUILD}"

則需要用 pkg 的路徑進行設定