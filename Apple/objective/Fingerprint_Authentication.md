# Fingerprint Authentication

## 設備支援

- iOS 8.0+
- iPhone 5S or superior
- LocalAuthentication.framework
- XCode 6+

## framework

LocalAuthentication.framework

## implementation

1. 導入 framework		

```
#import <localauthentication /LocalAuthentication.h>
```

2. 建立初始化 LAContext

```
LAContext *_context;
_context = [[LAContext alloc] init];
```

3. 檢查設備是否支援指紋驗證，這邊選擇的是『LAPolicyDeviceOwnerAuthenticationWithBiometrics』方法

- LAPolicyDeviceOwnerAuthenticationWithBiometrics:唯一用 touch id 進行驗證，當 touch id 被鎖住的話，必須輸入密碼，先行解鎖 touch id  
- 另一種:可同時選擇 touch id 與 passcode 解密

```
- (BOOL) canUseBiometrics
{
    return [_context canEvaluatePolicy: LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
}
```

4. 進行驗證

```
- (void) performAuthentication
{
    if ( ![self canUseBiometrics] ) return;

    /*
     Validate and verify a Touch ID fingerprint.
     */
    [_context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
            localizedReason:@"Authenticate for server login"
                      reply:^(BOOL success, NSError *authenticationError)
     {
         if ( success ) {
             NSLog(@"User is authenticated successfully");
         } else {
             switch ( authenticationError.code ) {
                 case LAErrorAuthenticationFailed:
                     NSLog(@"Authentication Failed");
                     break;
                 case LAErrorUserCancel:
                     NSLog(@"User pressed Cancel button");
                     break;
                 case LAErrorUserFallback:
                     [self showPasswordAlert];
                     break;
             }
         }
     }];
}
```


5. 增加錯誤 feedback 的 response

```
- (void) showPasswordAlert
{
    UIAlertView *passwordAlert = [[UIAlertView alloc]
                                  initWithTitle:@"Demo"
                                  message:@"Please type your password"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  otherButtonTitles:@"Ok", nil];

    [passwordAlert setAlertViewStyle:UIAlertViewStyleSecureTextInput];
    [passwordAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( buttonIndex == 1 )
    {
        NSLog(@"%@", [alertView textFieldAtIndex:0].text );
    }
}
```