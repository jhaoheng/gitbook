# switch

## ex1

```
switch sExpr {
case expr1:
	some
case expr2:
	some...
default:
	other
}
```

sExpr 和 expr1、expr2、expr3 的類型必須一致。
Go 的 switch 非常靈活，表達式不必是常量或整數，執行的過程從上至下，直到找到匹配項；
而如果 switch 沒有表達式，它會匹配 true。

```
i := 10
switch i {
case 1:
	fmt.Println("i is equal to 1")
case 2, 3, 4:
	fmt.Println("i is equal to 2, 3 or 4")
case 10:
	fmt.Println("i is equal to 10")
default:
	fmt.Println("All I know is that i is an integer")
}
```

在第 5 行中，我們把很多值聚合在了一個 case 裡面，
同時，Go 裡面 switch 默認相當於每個 case 最後帶有 break，匹配成功後不會自動向下執行其他 case，而是跳出整個 switch, 
但是可以使用 `fallthrough` 強制執行後面的 case 代碼。

```
integer := 6
switch integer {
case 4:
	fmt.Println("The integer was <= 4")
	fallthrough
case 5:
	fmt.Println("The integer was <= 5")
	fallthrough
case 6:
	fmt.Println("The integer was <= 6")
	fallthrough
case 7:
	fmt.Println("The integer was <= 7")
	fallthrough
case 8:
	fmt.Println("The integer was <= 8")
	fallthrough
default:
	fmt.Println("default case")
}
```
上面輸出
```
The integer was <= 6
The integer was <= 7
The integer was <= 8
default case
```
