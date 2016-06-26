## general setting
- .h

```
typedef NS_ENUM(NSInteger, AKeyBoardType) {
    AKeyBoardType_settingPin,
    AKeyBoardType_insertPin,
    AKeyBoardType_changePin
};

#define AKeyBoardType_String(enum) [@[@"AKeyBoardType_settingPin",@"AKeyBoardType_insertPin",@"AKeyBoardType_changePin"] objectAtIndex:enum]


@property (nonatomic) AKeyBoardType AKBType;
```

- .m

```
- (void)setAKBType:(AKeyBoardType)AKBType
{
	NSLog(@"%@",AKeyBoardType_String(AKBType));
}
```

## function

- .h
```
- (void)testFunction:(AKeyBoardType)AKBType;
```

- .m
```
NSLog(@"%@",AKeyBoardType_String(AKBType));
```