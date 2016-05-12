
【view1 要傳資訊 給 view2】

```
需由view2註冊相關資訊，如下
#import “view1.h”

[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(test:) name:one object:nil];
    
[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(test:) name:two object:nil];
    
[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(test:) name:three object:nil];


- (void)test:(NSNotification *)sender
{
    NSLog(@"%@",sender.name);
    NSLog(@"%@",sender.object);
}
```

【view1的註冊資訊如下】

```
(.h)
extern NSString *const one;
extern NSString *const two;
extern NSString *const three;

(.m)
NSString *const one = @"one";
NSString *const two = @"two";
NSString *const three = @"three";

- (void)click
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:one object:@"ok"];
}

- (void)click2
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:two object:@"ok"];
}

- (void)click3
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:three object:@"ok"];
}
```