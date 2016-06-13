## Toll-Free Bridging : 無損橋接

簡單來說就是因為 OC 是 C 的執行庫，而為了讓 OC 可以與 C 進行資料交換，就得利用 Toll-Free Bridging 進行資料格式的交換
如 NSArray 與 CFArray [參考](https://developer.apple.com/library/ios/documentation/CoreFoundation/Reference/CFArrayRef/index.html#//apple_ref/c/tdef/CFArrayRef)

> CFArray is “toll-free bridged” with its Cocoa Foundation counterpart, NSArray. This means that the Core Foundation type is interchangeable in function or method calls with the bridged Foundation object. Therefore, in a method where you see an NSArray * parameter, you can pass in a CFArrayRef, and in a function where you see a CFArrayRef parameter, you can pass in an NSArray instance. This also applies to concrete subclasses of NSArray. See Toll-Free Bridged Types for more information on toll-free bridging.

[Toll-Free Bridged Types](https://developer.apple.com/library/ios/documentation/CoreFoundation/Conceptual/CFDesignConcepts/Articles/tollFreeBridgedTypes.html#//apple_ref/doc/uid/TP40010677)


```
NSArray *_array = [[NSArray alloc]init]; 
NSString *values = {@"foo",@"bar"}; 
CFArrayRef arrayRef = CFArrayCreate(kCFAllocatorDefault, (void *)values, (CFIndex)2,NULL); 
NSArray *array = (__bridgeNSArray *)arrayRef;//注意這一行的__bridge 
NSDa
```

### NSString -> CFString
```
NSString *foo = @"bar"; 
CFStringRef bar = (__bridge CFStringRef)(foo); 
NSLog(@"%ld", CFStringGetLength(bar));
```

### CFString -> NSString
```
CFStringRef foo = CFStringCreateWithCString(kCFAllocatorDefault, "foo", kCFStringEncodingUTF8); 
NSString *bar = (__bridge NSString *)(foo);
NSLog(@"%ld", bar.length); 
CFRelease(foo);
```

### __bridge
目的在於處理 ARC <-> MRC 間的溝通

而 **『MRC 下的 Toll－Free Bridging 因為不涉及記憶體管理的轉移，相互之間可以直接交換使用。』**

[Toll-Free Bridged Types](https://developer.apple.com/library/ios/documentation/CoreFoundation/Conceptual/CFDesignConcepts/Articles/tollFreeBridgedTypes.html#//apple_ref/doc/uid/TP40010677) 
中，有支援 Toll-Free Bridging 的對照表