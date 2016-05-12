## 基本設定

```
NSURL *url = [NSURL URLWithString:@"https://tw.yahoo.com"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [webView loadRequest:requestObj];
    webView.scalesPageToFit = YES;
    [webView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:webView];
```

## status bar 網路動態顯示
```
	UIApplication *app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = YES;
```

## 架構
- 最好建立一個 UIWebView 的元件，獨立於其他頁面使用較好
- 因可以完全取用 uiwebview 的 delegete，架構也清晰，避免混用

## 注意
- http 安全性
	- 因 ios 強調安全性，故連接的網址必要都設為 https
		- 若直接用 `@"tw.yahoo.com"`，則無法讀取
		- 需改由 `@"https://tw.yahoo.com"`
	- 如非用 http，於 plist 中設定