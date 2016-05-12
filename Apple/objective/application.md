## 禁止螢幕休眠

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	application.idleTimerDisabled = YES;
}
```