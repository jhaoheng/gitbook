## 文檔

[官方bitcode](https://developer.apple.com/library/tvos/documentation/IDEs/Conceptual/AppDistributionGuide/AppThinning/AppThinning.html)

## 摘要
> Bitcode is an intermediate representation of a compiled program. Apps you upload to iTunes Connect that contain bitcode will be compiled and linked on the store. Including bitcode will allow Apple to re-optimize your app binary in the future without the need to submit a new version of your app to the store.  

> Xcode hides symbols generated during build time by default, so they are not readable by Apple. Only if you choose to include symbols when uploading your app to iTunes Connect would the symbols be sent to Apple. You must include symbols to receive crash reports from Apple.

> Note: For iOS apps, bitcode is the default, but optional. For watchOS and tvOS apps, bitcode is required. If you provide bitcode, all apps and frameworks in the app bundle (all targets in the project) need to include bitcode.  
After you distribute your app using iTunes Connect, you can download the dSYMs file for the build, described in Viewing and Importing Crashes in the Devices Window.


## 結論

bitcode 是一種由 xocde 遞交二進位檔給 itunes connect 時，產生的一種中間代碼。  
目的在於讓 apple 優化你的 app，並應用於未來不同種類的加載裝置。從此看來，未來可能會有許多不同類型的 32bit/64bit 的產品，在穿戴式裝置上，作為產品的價位區隔。  

這個選項是可選的，通常只需要在 xocde 7 中開啟此設定即可，預設是打開的。

![img](https://developer.apple.com/library/tvos/documentation/IDEs/Conceptual/AppDistributionGuide/Art/app_thinning_2x.png)

在Xcode 7中，我們新建一個iOS程序時，bitcode選項默認是設置為YES的。我們可以在」Build Settings」->」Enable Bitcode」選項中看到這個設置。不過，我們現在需要考慮的是三個平台：iOS，Mac OS，watchOS。

對於iOS，bitcode是可選的；對於watchOS，bitcode是必須的；而Mac OS是不支持bitcode。

## 另一個重要功能

觀看 crash 的 app report

> You can also view crashes for apps distributed using TestFlight or the store. If you include bitcode when you upload your app, the store retains the .dSYM files and you must download them before you can view crashes in the Devices window. If you don’t include bitcode or distribute your app outside the store, your archive already contains the .dSYM files.

每個 archive 包含一個 .dSYM，此檔案用來解析 crash log，會將之翻譯成我們看得懂的訊息。

大概意思，當你加入 bitcode 並且上傳你的 app，app store 會保留 .dSYM 的檔案，你可以下載它，並且用 xocde 中的 Devices window 觀看該 app 的 crash 報告。  
若沒使用 bitcode，你 archive 的檔案中也包含 .dSYM 的檔案。所以若用 adhoc，則你必須保留你的 archive 檔案，來觀察你的 crash log。

原因在於，每隻設備，都會產生 .dSYM 檔案，但必須與 archive or apple store / testflight 中的 uuid 進行對應，才可以進行分析。不然系統會告訴你無法分析，這也是為啥要保留 archive 檔案的關係。


[Analyzing Crash Reports](https://developer.apple.com/library/tvos/documentation/IDEs/Conceptual/AppDistributionGuide/AnalyzingCrashReports/AnalyzingCrashReports.html#//apple_ref/doc/uid/TP40012582-CH21-SW3)

1. 根據crash log，得到App的UUID。UUID是個字符串，由32個字符組成。得到了UUID，你才能知道是你的哪個版本在用戶的iPhone上出了問題。

## 測試教學

1. 開啟 dSYM，build Phases -> <search dsym>，即可看到
2. 寫一隻會 crash 的程式， ex : 陣列錯誤 or select 錯誤
3. compile 後，發現錯誤的記憶體位置 ```0x00002727```
3. 開啟 cmd，跳到 dSYM 的目錄下
4. 執行 ```dwarfdump --lookup 0x00002727 Crash.app dsYM/```

以上是用 dwarfdump 進行調適，xcode 中可用 device window 進行查看

別人的測試文章
http://tom19830924.blogspot.tw/2013/08/crash-reporting-tools.html


最後，基本上看
[Analyzing Crash Reports](https://developer.apple.com/library/tvos/documentation/IDEs/Conceptual/AppDistributionGuide/AnalyzingCrashReports/AnalyzingCrashReports.html#//apple_ref/doc/uid/TP40012582-CH21-SW3)

即可


## bug fixed

```
other c flag bitcode could not be generated because '/Users....'was build without full bitcode.
All object files and libraries for bitcode must be generated from xcode archive or install build for architecture arm64.
```

儘管 enable 後，還是出現這個 bug，好像是 armv7 啟用，但是 arm64 無法支援

### 解決方法
static library 中，build settings -> search(other c flags) -> 輸入 `-fembed-bitcode`

## 如何檢查 static lib 包含 bitcode 的設定
```
otool -l yourlib.a | grep bitcode
```
or
```
otool -l yourlib.a | grep __LLVM
```

你也可以先用 lipo 查詢該 static lib 的架構版本，再針對該結構進行檢察
```
lipo -info yourlib.a
otool -arch armv7 -l yourlib.a  | grep bitcode
otool -arch arm64 -l yourlib.a  | grep bitcode
```