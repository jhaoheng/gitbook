## xcode doc 存放位置

```usr/include/Availability.h```

也可直接在 .m 中，寫入 ```__IPHONE_9_2```，在用 cmd+click 跳到該 macros 文件中

## Explain

節錄

```
These macros are for use in OS header files. They enable function prototypes
and Objective-C methods to be tagged with the OS version in which they
were first available; and, if applicable, the OS version in which they 
became deprecated.  
 
The desktop Mac OS X and iOS each have different version numbers.
The __OSX_AVAILABLE_STARTING() macro allows you to specify both the desktop
and iOS version numbers.  For instance:
    __OSX_AVAILABLE_STARTING(__MAC_10_2,__IPHONE_2_0)
means the function/method was first available on Mac OS X 10.2 on the desktop
and first available in iOS 2.0 on the iPhone.
```

意指在文件中，透過此種方法來定義，該語法適用的版本

故像有些人會用

```
#ifdef __IPHONE_8_0
    //do something
#else
    //do something
#endif
```

來直接讓 code 直接自適應多少版本以上支援  
所以我想如果自建 lib 時，也應該加入這種版本控制
