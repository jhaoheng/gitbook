## 注意事項
- dev 的憑證，要用 dev 時，產生的 token，才可發送推播  
- pro 的憑證，要用 pro/adhoc 時，產生的 token，才可以推播

否則手機收不到，測試時間 20160219

- 若新設定的 appid enable remote notification 時，在 developer center 中的 provisioning 要重新設定，且 xcode 中的 provisioning 要重新獲取。

## ios8 up

- [ ]should to know : what is ```handleActionWithIdentifier:(NSString *)identifier```
- [ ]為何要特別將 ```[application registerForRemoteNotifications];``` 獨立寫在 method 上？不是也可直接用 ```[[UIApplication sharedApplication] registerForRemoteNotifications];```

1. in ```didFinishLaunchingWithOptions```

	```
	#ifdef __IPHONE_8_0
	  //Right, that is the point
	    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge
	|UIRemoteNotificationTypeSound
	|UIRemoteNotificationTypeAlert) categories:nil];
	    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
	#else
	    //register to receive notifications
	    UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
	    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
	#endif
	```
2. Add this Function

	```
	#ifdef __IPHONE_8_0
	- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
	{
	    //register to receive notifications
	    [application registerForRemoteNotifications];
	}
		
	- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
	{
	    //handle the actions
	    if ([identifier isEqualToString:@"declineAction"]){
	    }
	    else if ([identifier isEqualToString:@"answerAction"]){
	    }
	}
	#endif
	``` 
	
3. And your can get the deviceToken in

	```
	- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
	```

4. if it still not work , use this function and NSLog the error

	```
	-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
	```	

## old under ios8(include)
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

//notification
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                             settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                             categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
    return YES;
}


#pragma mark - remote Notification
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    /* Get device token */
    NSString *strDevToken = [NSString stringWithFormat:@"%@", deviceToken];
    
    /* Replace '<', '>' and ' ' */
    NSCharacterSet *charDummy = [NSCharacterSet characterSetWithCharactersInString:@"<> "];
    strDevToken = [[strDevToken componentsSeparatedByCharactersInSet: charDummy] componentsJoinedByString: @""];
    NSLog(@"Device Name=[%@]",[UIDevice currentDevice].name);
    NSLog(@"Device token=[%@]", strDevToken);
    
    /* 可以把token傳到server，之後server就可以靠它送推播給使用者了 */
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err
{
    NSLog(@"Error=[%@]", err);
    // TODO: when user do not allow push notification service, pop the warning message.
}

// This function called when receive notification and app is in the foreground.
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    /* 把收到的推播列舉出來 */
    for (id key in userInfo) {
        NSLog(@"Key=[%@], Value=[%@]", key, [userInfo objectForKey:key]);
    }
    
    /* 印出 Badge number */
    NSLog(@"Badge: %@", [[userInfo objectForKey:@"aps"] objectForKey:@"badge"]);
          
}
```