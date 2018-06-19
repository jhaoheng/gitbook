> 壓力測試用來檢測函數(方法）的性能，和編寫單元功能測試的方法類似,此處不再贅述，但需要注意以下幾點：

- 文件名稱必須是 xxxx_test.go 結尾
- 函式的名稱開頭必須大寫, XXXX 為自定義名稱

```
func BenchmarkXXX(b *testing.B) { ... }
```

- 執行方式 `go test -test.bench=".*"` 執行全部壓力測試


# example
https://github.com/jhaoheng/goTest