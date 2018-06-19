# reflect

> import "reflect"

```
t := reflect.TypeOf(i) 
v := reflect.ValueOf(i)
```

轉換為 reflect 後，可以進行的操作

```
tag := t.Elem().Field(0).Tag  //获取定义在struct里面的标签
name := v.Elem().Field(0).String()  //获取存储在第一个字段里面的值
```

v 的操作, Type(), Kind(), Float()
```
var x float64 = 3.4
v := reflect.ValueOf(x)
fmt.Println("type:", v.Type())
fmt.Println("kind is float64:", v.Kind() == reflect.Float64)
fmt.Println("value:", v.Float())
```