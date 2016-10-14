# 檢查 ipa 是 adhoc 還是 dev

## 手動檢查

1. Open Terminal and 'cd' to the folder containing your copy of the embedded.mobileprovision.
2. `security cms -D -i embedded.mobileprovision`

## code

```
NSData *provisioningProfile = nil;
NSData *raw = [NSData dataWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"embedded" withExtension:@"mobileprovision"]];
char *start = memmem(raw.bytes,
                     raw.length,
                     "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0",
                     47);
if (start) {
    char *end = memmem(start,
                       (uintptr_t)start - raw.length,
                       "</plist>",
                       8);
    if (end) {
        provisioningProfile = [NSData dataWithBytes:start length:8 + end - start];
    }
}

if (provisioningProfile) {
    NSDictionary* plist = [NSPropertyListSerialization propertyListWithData:provisioningProfile
                                                                    options:NSPropertyListImmutable
                                                                     format:0
                                                                      error:0];
    NSLog(@"\n\n\nTeam name: %@", plist[@"TeamName"]);

    if ([plist[@"ProvisionsAllDevices"] boolValue]) {
        NSLog(@"Enterprise");
    } else if ([plist[@"ProvisionedDevices"] count] > 0) {
        if ([plist[@"Entitlements"][@"get-task-allow"] boolValue]) {
            NSLog(@"Development");
        } else {
            NSLog(@"Ad Hoc");
        }
    } else {
        NSLog(@"App Store");
    }
}
```

## 分析結構

### Dev

若是 `Dev` build app，會看到

```
<key>get-task-allow</key>
<true/>
```

### Ad-Hoc

若是 `Ad-Hoc`

```
<key>get-task-allow</key>
<false/>
```
且

```
<key>ProvisionedDevices</key>
<array>
    <string>abcdef01234567890abcdef01234567890abacde</string>
    <string>1abcdef01234567890abcdef01234567890abacd</string>
    <string>2abcdef01234567890abcdef01234567890abacd</string>
</array>
```