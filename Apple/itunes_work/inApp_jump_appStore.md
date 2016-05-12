## 官方

- [Creating easy-to-read short links to the App Store for your apps and company](https://developer.apple.com/library/ios/qa/qa1633/_index.html)
- [Launching the App Store from an iOS application](https://developer.apple.com/library/ios/qa/qa1629/_index.html)

## 使用

```
NSString *iTunesLink = @"https://itunes.apple.com/us/app/apple-store/id375380948?mt=8";
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
```

## 流程

1. 建立一個 json 格式的下載檔案，記得 json 檔案中要放入日期版控。
2. 在 json 中，放入要顯示的連結與 icon 圖片位置。
3. 在 server 中，建立下載此 json 的 api。
4. 在 app 中建立『使用』的範例與 view，並且使用該 api 下載 json 文件，並儲存於
	- UserDefault。
	- 或者於 document 中建立 .plist 路徑位置。

## 可使用情境

1. 需跳轉到 app store 進行下載
2. 評價你的 app