# Bash編輯文件常用

## #!/bin/bash

## 顯示echo 
<pre>echo "string"</pre>

## 產生文件
<pre>echo "string" > file</pre>

## 寫入文件
<pre>echo "string" >> flie </pre>

## 若要在bash中執行 “>>”
遇到permission denied
則將 >> 改為 | sudo tee -a 即可
\>> 是bash執行，不具root權限，以tee 代替>>

## 查找文件中的字串...

## 讀取鍵盤輸入[read]
<pre>
-p 顯示提示,tokenKey為存起來的變數
read -p "token key : " tokenKey

-a 為輸入的內容轉為陣列, array為存起來的陣列
IFS='/' read -a array <<< "$repoLink" 
</pre>

## 在bash中執行指令，並且輸出轉變為字串
<pre>
OUTPUT="$(ls -1)"
echo "${OUTPUT}"
</pre>

## 字串
<pre>
將字串轉成陣列，用'/'作為切割
IFS='/' read -a array <<< "$repoLink"
</pre>

## 從 ps aux 的訊息轉變為陣列
```
subTopicStr=( $( ps aux | grep mqttSub.php | grep -n "/" | awk '{print $13}' ) );

echo ${subTopicStr[0]};
echo ${subTopicStr[1]};
```

## 陣列
<pre>
取得陣列中，最後一個元素
repoName="${array[ ${#array[@]}-1 ]}"

顯示陣列中的某個元素
echo ${array[2]}
</pre>

## 取得目前路徑
<pre>
BASEDIR=$(pwd)
echo $BASEDIR
</pre>

## echo 後文字顏色顯示設定
```
#!/bin/bash
printf "\E[0;35;40m"
echo " Menu of available command:"
printf "\E[0m"
echo " ========================================================"
printf "\E[0;31;40m"
echo " 1. Check Server Status"
echo " 2. display the month 3. display the day"
printf "\E[0m"
echo " --------------------------------------------------------"
printf "\E[0;32;40m"
echo " 4. Query Logs"
printf "\E[0m"
echo " --------------------------------------------------------"
printf "\E[0;33;40m"
echo " q. quit"
printf "\E[0m"
echo " ========================================================"
printf "\E[0;36;40m"
echo -n " Select a number from the list: "
printf "\E[0m"
```

## 變數的使用
指定parameter=‘設定’
使用$parameter

## 連續命令
若有同時兩個命令要執行, 必須使用 ; 來區隔
cd bin ; pwd

## 若要判斷file中是否有該string
使用grep -F 'toUpperCase(' *.file_extend_name

## 要讓grep時，不輸出在cmd上，需加入-q，如此可直接抓取列印出來的數字
若在find時，不想將結果輸出在螢幕上
請temp=($(sudo find /usr -name vimrc -print))
就可將變數放到temp中，並用$temp輸出

## Linux shell脚本的字符串截取
當有一串字串，要進行快速擷取的方法
[link](http://www.cnblogs.com/wangbin/archive/2011/10/11/2207179.html)

---
## 其他
【ubnutu(Linux) 指令集】
http://ahhafree.blogspot.tw/2011/11/ubuntulinux.html

http://wiki.weithenn.org/cgi-bin/wiki.pl?Script_%E6%8C%87%E4%BB%A4%E6%8A%80%E5%B7%A7

http://www.suse.url.tw/sles10/lesson10.htm

https://sites.google.com/site/tiger2000/home