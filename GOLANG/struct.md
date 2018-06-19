從 yaml 取得的檔案結構與名稱，要與 struct 的命名相同

``` yaml
database: 
  - host: "localhost"
    port: "6612"
    username: "root"
    password: "root"
    dbname: "cvr"
```

``` struct
type mysql struct {
    Host     string
    Port     string
    Username string
    Password string
    Dbname   string
}

type Config struct {
    Database []mysql
}
```

# struct array : [{},{}....]
```
type Profile struct {
	Name string
	Age  int
}
var users []Profile
users = append(users, Profile{Name:"max", Age:12})
users = append(users, Profile{Name:"sunny", Age:21})
```

# struct dictionary : {[{}], [{}] ...}

```
type profile struct {
	Name string
	Age  int
}
type user struct {
	Profile []profile
}

var u user
u.Profile = append(user.Profile, profile{Name:"max", Age:21})

# output : {"test":[{max 21}]}
```

# struct
https://gobyexample.com/structs

# struct(Point)

## 寫入或讀取
> 只要使用 pointer 方式傳值就可以正確將您需要改變的值寫入，所以這邊可以結論就是，如果只是要讀值，可以使用 Value 或 Pointer 方式。
> 但是要寫入，則只能用 Pointer 方式。其實在 Go 語言官方有整理 FAQ，竟然之前都沒發現，參考底下官方給的建議

## 效能
> 假設 Struct 內部成員非常的多，請務必使用 Pointer 方式傳入，這樣省下的系統資源肯定比 Copy Value 的方式還來的多。

## 一致性
> 在開發團隊內，如果有人使用 Pointer 有人使用 Value 方式，這樣寫法不統一，造成維護效率非常低，所以官方建議，全部使用 Pointer 方式是最好的寫法。


```
package main
import "fmt"

type Cart struct {
    Name  string
    Price int
}

func (c Cart) GetPrice() {
    fmt.Println("price:", c.Price)
}

func (c Cart) UpdatePrice(price int) {
    fmt.Println("[value] Update Price to", price)
    c.Price = price
}

func (c *Cart) UpdatePricePointer(price int) {
    fmt.Println("[pointer] Update Price to", price)
    c.Price = price
}

func main() {
    c := &Cart{"bage", 100}
    c.GetPrice()
    c.UpdatePrice(200)
    fmt.Println(c)
    c.UpdatePricePointer(200)
    fmt.Println(c)
}
```