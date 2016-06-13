# Transitioning to ARC Release Notes

[Transitioning to ARC Release Notes](https://developer.apple.com/library/ios/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011226-CH1-SW4)

> 為啥會寫這篇，原因在於，寫其他文章，莫名其妙整理這些東西，就順便註記了一下大綱

- ARC is supported in Xcode 4.2 for OS X v10.6 and v10.7 (64-bit applications) and for iOS 4 and iOS 5. Weak references are not supported in OS X v10.6 and iOS 4.
- Under ARC, strong is the default for object types.

## ARC Enforces New Rules
	- 不能明確的調用 `dealloc`，與直接使用 `retain`, `retainCount` 或者 `autorelease`。
		- 但一樣可以使用 `dealloc` 來管理資源，在 ARC 中客製化使用 `dealloc`，不需要使用 `[super delloc]`
		- 可以使用 `CFRetain`, `CFRelease` 與其他 **Core Foundation-style objects** 相關的功能 (參考 Managing Toll-Free Bridging)
	- 不能使用 `NSAllocateObject`, `NSDeallocateObject`
		- 可使用 `alloc`，runtime 會自動幫你處理需要 deallocating 的物件
	- You cannot use object pointers in C structures.
		- Rather than using a struct, you can create an Objective-C class to manage the data instead.
	- 必須使用特殊的類別轉換來告訴編輯器物件的生命週期，在 Objective-C 物件與 Core Foundatin 類型中傳遞參數。
	- 不能使用 `NSAutoreleasePool` 物件
	- You cannot use memory zones.
		- 不能使用 NSZone，現在在 Objective-C 運行下，會自動被忽略

### ARC 強化在命名方法上的限制
不能給予存取器開頭為 new 的物件名稱，若要給予一個開頭為 new 的物件名稱，則必須用 getter 指定不同的 

```
// Won't work:
@property NSString *newTitle; //Xcode 會給予錯誤
 
// Works:
@property (getter=theNewTitle) NSString *newTitle;
```

## ARC Introduces New Lifetime Qualifiers

### Property Attributes

- weak / strong : 有別於 MRC，是 ARC 下的新的宣告屬性
	- Under ARC, strong is the default for object types.
	- strong = retain
	- weak 相似於 assign，不同之處在於當 instance 被釋放後，property value 會被設定為 nil (assign remaining as a dangling pointer.)

### Variable Qualifiers

```
__strong : 預設
__weak : 當未被使用後，會被設定為 nil
__unsafe_unretained : 當沒被使用，且沒被設為 nil，若引用對象被釋放後，the pointer is left dangling.
__autoreleasing : 用來代表當參數通過 id * 傳遞後，在 return 會被 autoreleased
```

使用方法 `ClassName * qualifier variableName;`

#### 使用 __weak 測試
```
NSString *ref = @"test";
NSString * __weak string = ref;
NSLog(@"string: %@", string);  // test
    
NSString * __weak string2 = [[NSString alloc] initWithFormat:@"First Name: 123"]; //no other strong reference
NSLog(@"string: %@", string2); // null
```

#### Use Lifetime Qualifiers to Avoid Strong Reference Cycles
參考官方範例
主要在講 manual reference counting 與 使用 __block qualifier 的調用

> - In manual reference counting mode, \_\_block id x; has the effect of not retaining x. 
> - In ARC mode, \_\_block id x; defaults to retaining x (just like all other values).
> - To get the manual reference counting mode behavior under ARC, you could use \_\_unsafe_unretained __block id x; 但建議用 \_\_weak 取代(if you don’t need to support iOS 4 or OS X v10.6)

- 範例一：沒使用 __block
- 範例二：使用 __block
- 範例三：使用 __weak 替代 \_\_block
- 範例四：特殊使用 __weak 方法

## ARC Uses a New Statement to Manage Autorelease Pools

在 ARC 下，不能使用 `NSAutoreleasePool `，但可以用 `@autoreleasepool blocks` 替代

```
@autoreleasepool {
     // Code, such as a loop that creates a large number of temporary objects.
}
```

## Stack Variables Are Initialized with nil

ARC 下，strong, weak, autoreleasing 的堆疊變數初始化都為 nil

```
NSString *name;
NSLog(@"name: %@", name);// nil
```

## Use Compiler Flags to Enable and Disable ARC


ARC 下，對某個檔案

- 使用 `-fobjc-arc` 的旗標，開啟 ARC
- 使用 `-fno-objc-arc`，來取消 ARC

> ARC is supported in Xcode 4.2 and later OS X v10.6 and later (64-bit applications) and for iOS 4 and later. Weak references are not supported in OS X v10.6 and iOS 4. There is no ARC support in Xcode 4.1 and earlier.



## Managing Toll-Free Bridging
(管理 [無損橋接](http://maxhu.logdown.com/posts/734140-objc-c-toll-free-bridging-non-destructive-bridge))

在多數的 Cocoa application 中，需要使用 Core Foundation-style 的物件，無論是直接 Core Foundation framework (如 CFArrayRef or CFMutableDictionaryRef) 或者 採用 Core Foundation 的 frameworks 如 Core Graphics (CGColorSpaceRed 與 CGGradientRef)

因編輯器不會自動化的管理 Core Foundation 物件的生命週期，所以必須呼叫使用 CFRetain 與 CFRelease 來處理使用 Core Foundation 記憶體的規則
[see Memory Management Programming Guide for Core Foundation](https://developer.apple.com/library/ios/documentation/CoreFoundation/Conceptual/CFMemoryMgmt/CFMemoryMgmt.html#//apple_ref/doc/uid/10000127i)

如果轉換 Objective-C 與 Core Foundation，需要告知編輯器相關的定義 (defined in objc/runtime.h) 或者 Core Foundation-style 巨集 (defined in NSObject.h):

- __bridge transfers a pointer between Objective-C and Core Foundation with no transfer of ownership.
- __bridge_retained or CFBridgingRetain casts an Objective-C pointer to a Core Foundation pointer and also transfers ownership to you. You are responsible for calling CFRelease or a related function to relinquish ownership of the object.
- __bridge_transfer or CFBridgingRelease moves a non-Objective-C pointer to Objective-C and also transfers ownership to ARC. ARC is responsible for relinquishing ownership of the object.

EX:

```
- (void)logFirstNameOfPerson:(ABRecordRef)person {
 
    NSString *name = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSLog(@"Person's first name: %@", name);
    [name release];
}
```
轉換為
```
- (void)logFirstNameOfPerson:(ABRecordRef)person {
 
    NSString *name = (NSString *)CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
    NSLog(@"Person's first name: %@", name);
}
```

## The Compiler Handles CF Objects Returned From Cocoa Methods
轉換成適當的類別，不能直接使用 UIColor 放入 NSMutableArray 中，要轉換成 CGColor。
```
NSMutableArray *colors = [NSMutableArray arrayWithObject:(id)[[UIColor darkGrayColor] CGColor]];
[colors addObject:(id)[[UIColor lightGrayColor] CGColor]];
```

## Cast Function Parameters Using Ownership Keywords

接下來的範例中，陣列 array 透過 CGGradientCreateWithColors 進行轉換 

```
NSArray *colors = <#An array of colors#>;
CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
```

完整的範例如下

```
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGFloat locations[2] = {0.0, 1.0};
    NSMutableArray *colors = [NSMutableArray arrayWithObject:(id)[[UIColor darkGrayColor] CGColor]];
    [colors addObject:(id)[[UIColor lightGrayColor] CGColor]];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    CGColorSpaceRelease(colorSpace);  // Release owned Core Foundation object.
    CGPoint startPoint = CGPointMake(0.0, 0.0);
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds));
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGGradientRelease(gradient);  // Release owned Core Foundation object.
}
```

# Common Issues While Converting a Project

# Frequently Asked Questions


