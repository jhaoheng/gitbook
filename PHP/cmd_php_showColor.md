```
$string = "顯示";
$colorStart = "\033[31m";
$colorEnd = "\033[0m";
$cmd="echo -ne \"$colorStart".$string."$colorEnd\"";  
echo $cmd;
```