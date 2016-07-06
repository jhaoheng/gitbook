# 與其他bash文件溝通



## [[透過for迴圈 範例1]]
對某.bash 輸入參數

1 sh test.sh 10 20 30  (此方法無法指定參數，如參數a=100,b=50，單純靠for迴圈的陣列位置判斷)

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

## 函數getopts
sh test.sh -a args1 -b args2 -c args3
其中參數可留空
"sh test.sh -a args1 -b -c" or"sh test.sh -a args1 -bc" 

- [[getops 範例1]]

```
h1. Getops 範例1
注意 $OPTARG , 若b,c要自帶參數，也跟a一樣用$OPTARG

#!/bin/bash

#!/bin/bash
function testGetOpts1()
{
  local TMP_OPTIND=$OPTIND
  OPTIND=1
  echo -e "\n+ testGetOpts1() $@"
  while getopts  "a:b:c:d:" flag
  do
    echo "$flag" IND=$OPTIND ARG=$OPTARG
  done
  echo  OPTIND=$OPTIND
  echo ""
  OPTIND=$TMP_OPTIND
}

function testGetOpts2()
{
  local TMP_OPTIND=$OPTIND
  OPTIND=1
  echo -e "\n+ testGetOpts2() $@"
  while getopts  "a:b:c:" flag
  do
    echo "$flag" IND=$OPTIND ARG=$OPTARG
  done
  echo  OPTIND=$OPTIND
  echo ""
  OPTIND=$TMP_OPTIND
}

function testGetOpts3()
{
  local TMP_OPTIND=$OPTIND
  OPTIND=1
  echo -e "\n+ testGetOpts3() $@"
  while getopts  "abc:def:ghi" flag
  do
    echo "$flag" IND=$OPTIND ARG=$OPTARG
  done

  OPTIND=$TMP_OPTIND
}
```

輸入:

- testGetOpts2 -a "A" -b "B" -c "C"
- testGetOpts2 -a "A" -b "B"
- testGetOpts2 -a "A"
- testGetOpts1 -a "A" -b "B" -c "C" -d "D"
- testGetOpts3 -a -bc foo -f "foo bar" -h -gde

> 注意所有獲取的參數，都為$OPTARG

```
(請注意，  在 t,r,p,v 後面各緊接有「 : 」符號，因此它是有參數的)
while getopts “ht:r:p:v” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         t)
             TEST=$OPTARG
             ;;
         r)
             SERVER=$OPTARG
             ;;
         p)
             PASSWD=$OPTARG
             ;;
         v)
             VERBOSE=1
             ;;
         ?)
             usage
             exit
             ;;
     esac
done
```

3 函數getopt

- "參考連結":http://www.cnblogs.com/FrankTan/archive/2010/03/01/1634516.html