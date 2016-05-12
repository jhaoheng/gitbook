```
UIRemoteNotificationType types;
if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    types = [[UIApplication sharedApplication] currentUserNotificationSettings].types;
else
    types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];

return (types & UIRemoteNotificationTypeAlert);

```