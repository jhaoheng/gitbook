# xcode 單元測試
xcodebuild -exportArchive -archivePath te22.xcarchive -exportPath exportPath -exportFormat ipa -exportProvisioningProfile “KTB_Dev_160106”
## unit test 的使用方法

## 代碼覆蓋率開啟
1. 開啟專案 scheme -> edit scheme
2. 左側的欄位 Test -> 右側的欄位 Gather coverage data 勾選（代碼覆蓋）
3. 當你按下 command + U 後，所有的測試代碼運行通過，會有一個綠色的勾選。
4. compiler 後，到 Log 中，有三個標籤『Tests』、『Coverage』、『Log』可供查詢。


## testing
1. 開啟代碼覆蓋率
2. 在送 ci 前，先 run 過 oclint
2. 在 project 中，建立 yaml
3. 送到 github，自動執行 travis CI & CD
4. 成功就送到 deploy

## 範例
[Unit Testing Example with OCUnit](http://stackoverflow.com/questions/13711911/unit-testing-example-with-ocunit)
[Xcode 6单元测试：XCTestCase/XCTestExpectation/measureBlock()](http://www.cocoachina.com/industry/20140805/9314.html)

## 說明
[XCTestExpectation]  

- setUp : 每一個測試運行前被調用 ```- (void)setUp```
- tearDown : 在測試運行結束後被調用  ```- (void)tearDown```

# UI TEST
[iOS Automated Tests with UIAutomation](http://blog.manbolo.com/2012/04/08/ios-automated-tests-with-uiautomation)


# About Testing with Xcode[apple document]
https://developer.apple.com/library/prerelease/tvos/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/01-introduction.html#//apple_ref/doc/uid/TP40014132-CH1-SW1

- XCTest framework 透過所有的測試目標能夠自動的連接
	- xcode 5 提供 XCTest framework
	- xcode 6 提供 Performance Measurement
	- xocde 7 提供 UI Testing
	- Continues integration and Xcode Server，可透過 CLI 透過 mac 產生機器人，自動在 Xcode Server 執行 tests
	- 最新的進程，Xcode 可無痛轉移，從 OCUnit test 到 XCTest

	
## 關於 xcode 中，test 的導覽操作頁面
https://developer.apple.com/library/prerelease/tvos/recipes/xcode_help-test_navigator/Recipe.html#//apple_ref/doc/uid/TP40013329-CH1-SW1

- 可在該導覽頁面新增 Unit Test Target
	- 會產生一組新的測試目標
- 產生 Unit Test Class
	- Test classes are subclasses of XCTestCase.    