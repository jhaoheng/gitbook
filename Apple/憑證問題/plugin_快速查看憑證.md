<http://kfi-apps.com/plugins/ipaql/>

無意間發現這個好工具
通常我習慣去 developer center 中，檢查憑證與 uuid 是否正確
但其實很花時間

1. 安裝此 plugin 後，執行 `qlmanage -r`
2. 輸出 .ipa 檔案，按下 quicklook 的 hotkey，就可以看到此 ipa 相關資訊

如此一來就不用花時間檢查憑證到底有無安裝錯誤
（相信可能也是透過 xcodebuild 進行憑證檢查吧）

## FEATURES
- Displays app and provision information for ipa-files
- Displays provision information for iOS mobileprovision and OSX provisionprofile files
- Uses device names from the Developer Portal
- Generates thumbnails for ipa and provision files

![img1](http://kfi-apps.com/site/assets/files/1006/example.png)