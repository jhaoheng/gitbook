## travis 測試心得-objc

- 目標 xocde 7.3 / objective
- 步驟
	- 應先進行本地測試
	- 再將測試的 script 寫入 .travis.yml 中
- 使用測試工具有兩種 xcodebuild 與 xctool
	- xctool 需透過 brew 安裝（Travis 預設已安裝）
		- brew update
		- brew install xctool

- 測試檔案 [activity_keyBoard](https://github.com/jhaoheng/activity_keyBoard)

- 本地測試，所有想測試的，全部用 script 進行測試
	```
	xctool test -project activity_keyBoard.xcodeproj -scheme activity_keyBoard -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO
	```  
- 執行結果

	```
	[Info] Loading settings for scheme 'activity_keyBoard' ... (2041 ms)
	=== TEST ===
	  xcodebuild build build
	    activity_keyBoard / activity_keyBoard (Debug)
	      ✓ Check dependencies (241 ms)
	      ✓ Write auxiliary files (2 ms)
	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	...中間省略
	━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	      ✓ Compile Storyboard file Main.storyboard (7260 ms)
	      ✓ Compile Storyboard file LaunchScreen.storyboard (7263 ms)
	      ✓ Process Info.plist (104 ms)
	      ✓ Link Storyboards (147 ms)
	      ✓ Touch activity_keyBoard.app (10 ms)
	      0 errored, 0 warning (13782 ms)
	
	
	  [Info] Collecting info for testables... (0 ms)
	
	** TEST SUCCEEDED: 0 passed, 0 failed, 0 errored, 0 total ** (14763 ms)
	```
	
## 建立 .travis.yml

### mail
```
notifications:
  email:
    recipients:
      - moshe.maor@kaltura.com
      - jess.portnoy@kaltura.com
    on_success: change
    on_failure: always
```

### 基本
```
xcode_project: activity_keyBoard.xcodeproj
xcode_scheme: activity_keyBoard
osx_image: xcode7.3 #要求版本
```

### 目標分支
```
branch:
  only:
  - master
```

### 預先安裝
```
before_install:
  - brew update
  - brew outdated xctool || brew upgrade xctool
```

### script

```
xctool test -project activity_keyBoard.xcodeproj -scheme activity_keyBoard -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO
```
	
## debug

似乎要指定 xcode 的版本，不然會發生 storyboard 的建立問題，應該是預設全部的 xcode 都會進行測試，所以 xocde 6 的 build 無法通過。

另外就是 如果不適用 test，則似乎必須上傳憑證與密碼，讓系統在真機上運行測試。

## deploy

testflight
