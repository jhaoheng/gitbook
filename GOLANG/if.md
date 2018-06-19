https://gobyexample.com/if-else

```
if str, ok := data.(string); ok {
    /* act on str */
} else {
    /* not string */
}
```


# 敘述句優先於情況句

```
if num := 9; num < 0 {
    fmt.Println(num, "is negative")
} else if num < 10 {
    fmt.Println(num, "has 1 digit")
} else {
    fmt.Println(num, "has multiple digits")
}

# output : 9 has 1 digit
```