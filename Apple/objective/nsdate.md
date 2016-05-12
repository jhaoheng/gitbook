## 時區測試
根據以下三種不同的時區測試
會得到  
`NSLog(@"NSTimeInterval : %f",[[NSDate date] timeIntervalSince1970]);`

```
2016-03-26 14:44:33.650 test[40607:3409455] systemTimeZone : 2016-03-26 14:44:64
2016-03-26 14:44:33.652 test[40607:3409455] NSTimeZone : Asia/Taipei (GMT+8) offset 28800
2016-03-26 14:44:33.652 test[40607:3409455] NSTimeZone name : Asia/Taipei
2016-03-26 14:44:33.653 test[40607:3409455] NSTimeZone abbreviation : GMT+8
2016-03-26 14:44:33.653 test[40607:3409455] NSTimeInterval : 1458974673.653295

2016-03-26 14:44:33.654 test[40607:3409455] UTC : 2016-03-26 06:44:33
2016-03-26 14:44:33.654 test[40607:3409455] NSTimeZone : GMT (GMT) offset 0
2016-03-26 14:44:33.654 test[40607:3409455] NSTimeZone name : GMT
2016-03-26 14:44:33.654 test[40607:3409455] NSTimeZone abbreviation : GMT
2016-03-26 14:44:33.655 test[40607:3409455] NSTimeInterval : 1458974673.655102

2016-03-26 14:44:33.655 test[40607:3409455] GMT : 2016-03-26 06:44:33
2016-03-26 14:44:33.656 test[40607:3409455] NSTimeZone : GMT (GMT) offset 0
2016-03-26 14:44:33.656 test[40607:3409455] NSTimeZone name : GMT
2016-03-26 14:44:33.656 test[40607:3409455] NSTimeZone abbreviation : GMT
2016-03-26 14:44:33.656 test[40607:3409455] NSTimeInterval : 1458974673.656869
```

### 根據系統時區

```
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
    NSTimeZone *sys = [NSTimeZone systemTimeZone];
    [dateFormatter setTimeZone:sys];
    NSString *localeDate = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"systemTimeZone : %@",localeDate);
    NSLog(@"NSTimeZone : %@",sys);
    NSLog(@"NSTimeZone name : %@",sys.name);
    NSLog(@"NSTimeZone abbreviation : %@",sys.abbreviation);
    NSLog(@"NSTimeInterval : %f",[[NSDate date] timeIntervalSince1970]);
```

### 根據 UTC 

```
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSTimeZone *utc = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter2 setTimeZone:utc];
    NSString *dateString = [dateFormatter2 stringFromDate:[NSDate date]];
    NSLog(@"UTC : %@",dateString);
    NSLog(@"NSTimeZone : %@",utc);
    NSLog(@"NSTimeZone name : %@",utc.name);
    NSLog(@"NSTimeZone abbreviation : %@",utc.abbreviation);
    NSLog(@"NSTimeInterval : %f",[[NSDate date] timeIntervalSince1970]);
```

### 根據 GMT

```
    NSDateFormatter *dateFormatter3 = [[NSDateFormatter alloc] init];
    dateFormatter3.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [dateFormatter3 setTimeZone:gmt];
    NSString *timeStamp = [dateFormatter3 stringFromDate:[NSDate date]];
    NSLog(@"GMT : %@",timeStamp);
    NSLog(@"NSTimeZone : %@",gmt);
    NSLog(@"NSTimeZone name : %@",gmt.name);
    NSLog(@"NSTimeZone abbreviation : %@",gmt.abbreviation);
    NSLog(@"NSTimeInterval : %f",[[NSDate date] timeIntervalSince1970]);
```

## 將 time interval 轉為 nsdate

```
NSDate * newNow = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
    NSLog(@"%@",newNow);
    
+ (instancetype)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs;
+ (instancetype)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti;
+ (instancetype)dateWithTimeIntervalSince1970:(NSTimeInterval)secs;
+ (instancetype)dateWithTimeInterval:(NSTimeInterval)secsToBeAdded sinceDate:(NSDate *)date;
```