# defer

defer 是延遲執行的語句，在函式執行到最後時，這些 defer 會按照逆序執行，然後才 reture。尤其在打開一些資源做操作時，遇到錯誤時，要關閉資源連線，避免造成記憶體洩漏等問題，這時就可以利用 defer。

ex: 在每一次 return 前都會執行 file.Close()
```
func ReadWrite() bool {
	file.Open("file")
	defer file.Close()
	if failureX {
		return false
	}
	if failureY {
		return false
	}
	return true
}
```

defer 採後進先出
```
for i := 0; i < 5; i++ {
	defer fmt.Printf("%d ", i)
}
```
會依序輸出  4 3 2 1 0  