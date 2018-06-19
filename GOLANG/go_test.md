https://github.com/astaxie/build-web-application-with-golang/blob/master/zh/11.3.md

https://godoc.org/testing

## synopsis

1. 執行方法 : `go test`
2. 設定
	- 文件名稱必須是 `_test.go` 當作結尾
	- xxx_test.go 必須 `import "testing"`
	-  所有的測試 func 必須以 Test 當作開頭, ex : `func Test_Division_1(t *testing.T)`
		- 測試的 func 帶入的參數為 `t *testing.T` 
	- `testing.T`
		- Error
		- Errorf
		- FailNow
		- Fatal
		- FatalIf
3. 透過 test 的內容，執行適當的 func

## example
git@github.com:jhaoheng/goTest.git

# 問題 : 如何指定目錄進行測試
> https://golang.org/pkg/testing/#hdr-Subtests_and_Sub_benchmarks

1. 在測試目錄下
2. 全部測試 (提供多種方法)
	- `go test`
	- `go test -run ''`
3. 針對特定 test func() 進行測試
	- `go test -run Foo` : Foo is func name => function TestFoo(), 大小寫注意
	- `go test 目錄/hello_test.go 目錄/tool.go` : 針對特定檔案(hello_test.go)、並加入協作檔案(tool.go)

