go install 會在 GOPATH 下建立
- /bin
- /pkg

至於 src 為存在 source code 的位置


做好 package 後
要再做一個 test

所以 go 的 test 是針對該 folder 下的所有 golang 進行測試

# 如何建立一個 gopath
https://github.com/astaxie/build-web-application-with-golang/blob/master/zh/01.2.md

## gopath 目錄結構
- src 存放源代码（比如：.go .c .h .s等）
- pkg 编译后生成的文件（比如：.a）
- bin 编译后生成的可执行文件（为了方便，可以把此目录加入到 $PATH 变量中，如果有多个gopath，那么使用${GOPATH//://bin:}/bin添加所有的bin目录）

# 學習項目

1. go basic
2. go database
3. go framework

# study

1. ubuntu env
	- install go