```
NSString *colorHex;
    if ([device respondsToSelector:selector]) {
        colorHex = [device performSelector:selector withObject:@"DeviceColor"];
        
        NSLog(@"DeviceColor: %@ DeviceEnclosureColor: %@", [device performSelector:selector withObject:@"DeviceColor"], [device performSelector:selector withObject:@"DeviceEnclosureColor"]);
    }
```