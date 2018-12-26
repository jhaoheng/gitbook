# 在第一行輸入新資料
sed -i '1i {data...}' {file}


# 替換文件中的變數

``` test.conf
# sed 's/要被取代的字串/新的字串/g'
listen   $listen;
http_hooks {
    enabled         $enable;
}
```

```set.sh
#!/bin/bash

replace=""
if [ $enable ];then
    replace=$replace"s/\$enable/off/g;"
fi
if [ $listen ];then
    replace=$replace"s/\$listen/8080/g;"
fi

sed $replace test.conf > hello.conf
```