# 快速設定

1. 建立 folder
2. 建立 file.go, 名稱隨意
3. 在 file.go 中的 package name = folder name
4. file.go 中的 func 名稱，開頭要大寫

# package 內容


```
package  {package title}

func {func name} (x float64) float64 {
     z := 0.0
     for i := 0; i<1000; i++ {
         z -= (z*z - x) / (2 * x)
     }
     return z
}
```

- {package title} : 要跟 package 的 folder 名稱相同
- {func name} : 第一個字母要大寫
- {file} name : 任意

# 在 main 中

```
package main

import (
    "{package path}/{package folder}"
)

func main() {
    r := {package folder}.{package func name}()
}
```

- {package path} : 要注意這個路應是以 $GOPATH/src/.... 為主
- {package folder} : package 所在位置的 folder
- {package func name} : package 中，{file} 中的 {func name}