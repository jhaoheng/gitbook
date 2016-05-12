- https://developer.apple.com/library/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/LaunchServicesKeys.html
	- LSApplicationQueriesSchemes
	> Specifies the URL schemes the app is able to test using the canOpenURL: method. See LSApplicationQueriesSchemes for details.
	指定 url scheme 能夠去 使用 `canOpenURL:`
	
- https://developer.apple.com/library/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html
	- NSAppTransportSecurity
	> 指定設定的 domain 可以使用 http 連線

## 白名單分為

- app 白名單
	
	```
	<key>LSApplicationQueriesSchemes</key>
	<array>
	 <string>lineauth</string>
	 <string>line3rdp.$(APP_IDENTIFIER)</string>
	</array>
	```
- domain 白名單
	- 可參考 "**xcode_http_https_問題**"