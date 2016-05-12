# xcode scheme
https://developer.apple.com/library/mac/recipes/xcode_help-scheme_editor/Articles/SchemeDiagnostics.html#//apple_ref/doc/uid/TP40010402-CH9-SW1

## 環境
xcode 7.2

scheme 感覺很像一個動作要執行前的設定檔  
部分內容有點像 info.plist。

左側邊，每個欄位選項，點左側箭頭，都有三種狀態，我的理解是

- Pre-actions : 執行程序前
- <item name> : 執行程序的設定，根據執行的目的，可選擇不同的設定
- Post-actions : 執行程序後

## Pre and Post

在這，都可以執行兩種動作

1. 寄信
	- 當你選擇新增信件時，會有三個選項填寫：
		1. To : example@gmail.com
		2. Subject : example_subject_title
		3. Message : example_message
2. 寫入 bash script 的執行緒
	- 可直接指定 電腦中 Shell 的位置
	- 可直接從 target 中選擇提供的 script，如果你在該 target->build phase->run script 有的話。
	- 也可直接從你的 work space 直接將檔案拖進去，他會自動輸入路徑
	- 或者直接在 scheme 的 actions 中，直接寫 script

## 主要執行動作

- Build : 可以看到目前所有 target 可被執行的項次
- Run : will build and run the target on the selected device or simulator.
- Test : will build your target and run its unit tests (YourTargetNameTests.m)
- Profile : will build and run your target on the selected device or simulator with an Instruments tool of your choosing (Leaks, Allocations, etc.)
- Analyze : will build your target using the static analyzer and let you know of certain types of bugs in your code.
- Archive : 建立 ipa

1. 大概每個都有 debug / release，建議在正式後，要將 Debug 改成 release  
ex : 當你包成 static lib，若是 debug，則產生 error 的時候，會自動跳到該行程式碼，儘管你 compile 為 static lib    
2. 如果你有多個 target，也可以共用一個 scheme  
	所以我能理解早期為何 apple 提供兩個預設 scheme，debug 與 release
3. 裡面有些會有 Arguments 與 Diagnostics 這兩個可能會常用到
	- Arguments : 主要是你 run script 時，你可以放入的環境變數
	- Diagnostics : 當你有無法判定的錯誤時，進去裡面找你要的勾選起來吧，勾選並不會影響你的 code
4. 在 test 中可開啟，測試覆蓋率

[Diagnostics 設定](https://developer.apple.com/library/mac/recipes/xcode_help-scheme_editor/Articles/SchemeDiagnostics.html#//apple_ref/doc/uid/TP40010402-CH9-SW1)

- Memory management
	- in Release environment close AddressSenitizer
- Runtime Sanitization
- Logging options
- Debugger options