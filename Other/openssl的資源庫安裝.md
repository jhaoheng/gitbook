## openssl
可用來加密許多要傳送的資料，據說可以用 osx 的 lib path，直接放在 xcode 裡面，但我不太清楚位置應該指向何處

## 建立 libcrypto.a

- clone 此專案 https://github.com/sqlcipher/openssl-xcode
- 到 openssl 的網頁上，下載 openssl [.tar.gz] 結尾的檔案
- 將上述 openssl-1.0.xx.tar.gz 放入 openssl-xcode 的 folder 中
- 執行 openssl.xcodeproj 並進行 compile

一樣 static lib 的檔案會分成 debug 與 release，可查詢 lipo  
```lipo -create lib_release.a lib_debug.a -output lib_combined.a```

你可以透過 workspqce 指定路徑的方法，節省你的每次都需要合併的時間
如：http://n11studio.blogspot.tw/2013/07/xcodestatic-lib.html


