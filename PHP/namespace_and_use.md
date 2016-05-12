# namespace

## 解釋
命名空間 (namespace) 用來組織與管理程式碼，主要是為了避免不同程式檔案中定義相同的識別字 (identifier) 名稱（避免名稱衝突）。

class把一個一個function組織起來，namespace可以理解成把一個一個class,function等有序的組織起來。個人覺得，namespace的主要優勢有
第一,可以更好的管理代碼
第二,文件一多，可以避免class，function的重名
第三,代碼可讀性增強了

例如 
```
1.php 中有 $demo
2.php 中也有 $demo
```

如何判斷是用哪一個 $demo

http://pydoing.blogspot.tw/2013/03/PHP-namespace.html

# use

當在每個檔案中將 `namespace` 命名完成後
即可在其他 .php 中，使用 `use` 引用該空間

```
\userCenter\register; //絕對調用  
userCenter\login; //相對調用  
use userCenter\register; //引用空間  
use userCenter\register as reg; //引用空間並加別名 
```