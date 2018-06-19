
但這樣 GOPATH 有什麼用途？


# 如何建立一個 package
# 如何使用 package 建立執行檔
# 獲取遠端套件
go get {github.com/a/b/c}
import github.com/a/b/c


# cmd

- build : 編譯代碼，若有需要也會同時編譯相關的 package
	- 若是 package {name} 執行，不會有任何事情發生
	- 若是 package main 執行，會在目錄下產生一個執行檔，若此時執行 go install 會在 $GOPATH/bin 下產生執行檔。
	- 可使用 `go build -o {path}` 產生以其他名稱為主的執行文件。默認情況是你的 package 名(非 main 包)，或者是第一個源文件的文件名( main 包)。
		- 照他這樣講，可以在此 folder 中，同時存在 package 與 main 的包裝
		- 可帶上路徑
	- 只想編譯 folder 下的某個 xxx.go 文件 : `go build xxx.go`
	- go build會忽略目錄下以 `_` 或 `.` 開頭的go文件。
	- go build 在編譯文件時，若文件名中有 `作業系統` 的以系統命名的後綴詞，ex:`test_linux.go`,`test_darwin.go`，則 linux 下編譯時，會將 `test_darwin.go` 省略。
- clean : 會清除此 folder 下的
	- `_obj/`
	- `_test/`
	- `_testmain.go`
	- 執行 `go clean -i -n` : 印出 clean 要執行的語法，但不執行
		- `-i` : 清除關聯的安裝包與可運行的文件
		- `-n` : 把清除的指令印出來，且不執行清除
		- `-r` : 循環清除
		- `-x` : 把清除的指令印出來，且執行
- fmt : 格式化 `.go` 的檔案，維持制式的 style，好閱讀。使用此指令，就是調用 `gofmt` 指令
- get : 
	- `-fix` : 下載後，先執行 fix tool
	- `-insecure` : 使用非安全性的方式下載
	- `-t` : 同時測試
	- `-u` : 強制更新 package 與他的依賴庫
	- `-v` : 顯示詳細的過程與輸出 debug 
- install
	- 會執行兩個步驟的操作
		1. 產生結果文件(可執行文件 or .a)
		2. 將結果文件搬移到 `$GOPATH/pkg` or `$GOPATH/bin`
	- 參數支持 `go build` 的編譯參數
- test
	- 執行此指令，會自動讀取源碼目錄下的 *_test.go 文件，建立相關的執行文件
	- 默認的情況下，不需要任何的參數，會自動地把所有的文件測試完畢，也可帶上參數。詳情 
		- `go help testflag`
		- `go help testfunc`
	- 測試要多找範例看一下，不然有點複雜
- go tool
	- 使用 `go tool` 可查看所有的 command
	- `go tool vet directory|files` : 用來分析指定的目錄或者檔案是否都是正確的代碼，或者出現無用的代碼
- go generate
	- 在 `.go` 中，加入 `//go:generate cmd arg`，當執行 `go generate 時，會依序執行這些代碼，跳過其他代碼
	- 也就是，如果執行此，可以預先 
		- 單元測試
		- 安裝套件
		- 執行某些命令
	- ex
		```
		package main
		
		import (
		    "fmt"
		    "mymath"
		)
		
		//go:generate echo hello
		//go:generate go build main.go
		//go:generate  echo file=$GOFILE pkg=$GOPACKAGE
		
		func main() {
		    fmt.Printf("Hello, world. Sqrt(2)=%v\n", mymath.Sqrt(2))
		}
		```
- doc
	- `go doc fmt`
	- `godoc -http:8080` : 可在本地端開啟 doc, 注意是 godoc 指令
- list
	- `go list` : 查看目前 project 安裝的 package
