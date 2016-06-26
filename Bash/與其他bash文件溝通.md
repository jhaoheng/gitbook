# 與其他bash文件溝通


對某.bash 輸入參數

1 sh test.sh 10 20 30  (此方法無法指定參數，如參數a=100,b=50，單純靠for迴圈的陣列位置判斷)

- [[透過for迴圈 範例1]]

```
h1. 透過for迴圈 範例1
test.sh

#!/bin/bash

for arg in "$*"
do
    echo $arg
done

for arg in "$@"
do
    echo $arg
done

執行命令

sh test.sh -f config.conf -n 10

輸出

# 以下為$*的輸出
-f config.conf -n 10

# 以下為$@的輸出
-f

config.conf

-n

10    
```

``` 
   [重點] 
   指令 : "sh test.sh -f config.conf -v --prefix=/home"
   $0 ： ./test.sh,即命令本身，相當於C/C++中的argv[0]
   $1 ： -f,第一個參數.
   $2 ： config.conf
   $3, $4 ... ：類推。
   $#  參數的個數，不包括命令本身，上例中$#為4.
   $@ ：參數本身的列表，也不包括命令本身，如上例為 -f config.conf -v --prefix=/home
   $* ：和$@相同，但"$*" 和 "$@"(加引號)並不同，"$*"將所有的參數解釋成一個字符串，而"$@"是一個參數數組
```

2 函數getopts
sh test.sh -a args1 -b args2 -c args3
其中參數可留空
"sh test.sh -a args1 -b -c" or"sh test.sh -a args1 -bc" 

- [[getops 範例1]]

```
h1. Getops 範例1
注意 $OPTARG , 若b,c要自帶參數，也跟a一樣用$OPTARG

#!/bin/bash

while getopts "a:bc" arg #选项后面的冒号表示该选项需要参数
do
        case $arg in
             a)
                echo "a's arg:$OPTARG" 
                ;;
             b)
                echo "b"
                ;;
             c)
                echo "c"
                ;;
             ?)  # 例外
            echo "unkonw argument"
        exit 1
        ;;
        esac
done

輸入 "sh test.sh -a arg -b -c"

輸出

a's arg:test
b
c
```

```
   注意所有獲取的參數，都為$OPTARG
```

3 函數getopt

- "參考連結":http://www.cnblogs.com/FrankTan/archive/2010/03/01/1634516.html