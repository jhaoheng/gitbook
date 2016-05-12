## 获取设备上所有App的bundle id

```
include <objc/runtime.h>
```
```
Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
NSLog(@"apps: %@", [workspace performSelector:@selector(allApplications)]);
```

> 真想用的话, 文本做一下混淆
比如 @selector(defaultWorkspace) 改成NSSelectorFromString(unObfuscate("混淆的串"))
再做个服务器控制的开关, 审核时候不要运行这块代码, 过审应该不是问题.
不要那么傻白甜, 看见私有api就怕不能上架