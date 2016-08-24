## path
```Foundation/NSBundle.h```

## show content
```
NSLog(@"%@",[[NSBundle mainBundle] infoDictionary]);
```

可取得參數

- BuildMachineOSBuild
- CFBundleDevelopmentRegion
- CFBundleExecutable
- CFBundleIdentifier : bundle id
- CFBundleInfoDictionaryVersion
- CFBundleInfoPlistURL : "info.plist" 的檔案位置
- CFBundleName
- CFBundleNumericVersion
- CFBundlePackageType
- CFBundleShortVersionString : **Version**
- CFBundleSignature
- CFBundleSupportedPlatforms
- CFBundleVersion : **Build**
- DTCompiler
- DTPlatformBuild
- DTPlatformName
- DTPlatformVersion
- DTSDKBuild
- DTSDKName
- DTXcode
- DTXcodeBuild
- LSRequiresIPhoneOS
- MinimumOSVersion
- UIDeviceFamily
- UILaunchStoryboardName
- UIMainStoryboardFile
- UIRequiredDeviceCapabilities : 支援裝置的架構
- UISupportedInterfaceOrientations : 支援裝置的旋轉方向


# about CFBundle

## path

```CoreFundation/CFBundle.h```

# 讀取所有的 framework

[NSBundle allframework];

