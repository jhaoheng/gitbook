## 測試 - 透過 group 傳遞參數

- app

	```
	NSString *valueToSave = @"https://www.apple.com";
	NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.fastUrlSharedDefaults"];
	[sharedDefaults setObject:valueToSave forKey:@"url"];
	[sharedDefaults synchronize];
	```
	
- widget

	```
	NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.fastUrlSharedDefaults"];
	NSString *fastUrl = [sharedDefaults stringForKey:@"url"];
	```

## 其他檔案間的溝通：圖片、資料庫

- app : viewcontroller.m

	```
	// 像是需要使用 SQLite 的檔案 myDB.db
	 NSURL *appGroupDirectoryPath = [[NSFileManager defaultManager] 
	 containerURLForSecurityApplicationGroupIdentifier:@"group.fastUrlSharedDefaults"];
	 NSURL *dataBaseURL = [appGroupDirectoryPath URLByAppendingPathComponent:@"myDB.db"];
	 
	// 或是圖檔也是一樣的情況
	 NSURL *containerURL = [[NSFileManager defaultManager] 
	 containerURLForSecurityApplicationGroupIdentifier:@"group.fastUrlSharedDefaults"];
	 containerURL = [containerURL URLByAppendingPathComponent:@"pic.png"];
	 UIImage *contents=[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:containerURL]];
	```

## 消除 widget 四周的空白空間
	
	```//TodayViewController.m
	-(UIEdgeInsets) widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
	    return UIEdgeInsetsZero;
	}
	```

## widget 喚醒 host app

```

```

## 修改 widget 顯示名稱 
`info.plist 中，bundle display name`

## 在 widget 中使用 openURL

	```
	NSURL *url = [NSURL URLWithString:@"https://www.apple.com"];
	 
	// 在 widget 中 無法使用這個方法 (會報錯誤)
	[[UIApplication sharedApplication] openURL:url];
	 
	// 而是要使用這個方法
	[self.extensionContext openURL:url completionHandler:^(BOOL success) {
	    NSLog(@"fun=%s after completion. success=%d", __func__, success);
	}];
	```
	根據 Apple 的說法 這個方法只能使用在開啟主 app 的功能，如果要開啟其他的 app 則在上架審查時 可能會有額外的檢查 以確保符合規則

## widget 多國語言