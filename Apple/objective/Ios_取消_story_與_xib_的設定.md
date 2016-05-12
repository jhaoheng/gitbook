# Ios 取消 story 與 xib 的設定

1. 刪除掉所有得 .xib .story 
2. 至 targets -> Deployment info -> Main interface 刪除
3. 同上 -> App icon and launch images 刪除掉 Launch screen file
4. 在 appDelegate.h 加入標頭檔
5. 同上 .m 中，加入以下

```
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[baseViewController alloc] init];
```