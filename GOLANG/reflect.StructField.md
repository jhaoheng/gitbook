https://stackoverflow.com/a/30889373

```
type NodeConfig struct {
	NId uint8 `toml:"nid"`
	Label uint32 `toml:"label"`
	ReId string `toml:"reid"`
}
```

tag 允許附加多個更多資訊

用於信息的轉換

通常用於從其他的格式解碼 or 編碼的轉換
也可用來存儲任何想要設定的元信息


- 官方 : https://golang.org/pkg/reflect/#StructField

```
type {StructField} struct {
	{Name} string ``
}
```

# 透過 struct 取得相關映射資訊
https://studygolang.com/articles/4911