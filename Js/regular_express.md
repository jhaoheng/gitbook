http://jsbin.com/telowonabe/edit?html,js,output

將以下 js 代碼，寫在 jsbin 中，str 為需要驗證的 str，objRE 為 正則表示的規則

```
var str = "ad0jhg";
var objRE = new RegExp("^(?=.*[0-9])(?=.*[A-Za-z]).{6,15}$");
var result = str.match(objRE);
document.write(result);
```