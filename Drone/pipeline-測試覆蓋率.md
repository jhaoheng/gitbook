# 覆蓋率

> Coverage 與 CI 到底有什麼不同，兩者都可以執行測試項目，但 Coverage 可以評估，在測試項目內的測試代碼覆蓋率的比例。

- 所以測試順率為
	1. 本地測試
	2. 執行 CI，CI 測試完成後，會推送報告給 Coverage

## 衡量指標
- 函數覆蓋(Function Coverage)  
- 敘述覆蓋(Statement Coverage)  
- 決策覆蓋(Decision Coverage)  
- 條件覆蓋(Condition Coverage)  

> 通用範例, ex1

```
int foo (int x, int y){
	if (x>y) {
		return x;
	}
	return y;
}
```

## Function Coverage
> 顧名思義，就是這個函數是否被測試代碼調用。

## Statement Coverage
> 對 func 帶入參數，會造成某些敘述的行代碼，無法被執行到，指的是每一行代碼是否被測試覆蓋。

## Decision Coverage
> 指的是某一個邏輯分支是否被覆蓋。語句覆蓋與決策覆蓋通常有關係。對 func 帶入參數，在決策（if ... true/false）的判斷上，每一行都需要執行到。 

## Condition Coverage
> 對每個 func (if... elseif... else...)都需要把所有的條件進行測試。Condition 滿足，不代表 Decision 滿足。

# example

1. 必須要知道，使用的 code 要怎麼做單元測試的指令
2. 在測試的指令中，必須要加入輸出 覆蓋率 的檔案，在 golang 中是 `go test -coverprofile=coverage.out`
3. 將 (2) 中的指令，放到 .drone.yml 中。doc : http://plugins.drone.io/robertstettner/drone-codecov/

```
  codecov:
    image: robertstettner/drone-codecov
    token: d8ed8d81-e443-4699-bd03-981b6f62e470
    files:
      - /srv/drone-demo/example/coverage.out
```