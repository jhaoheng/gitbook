# AFNetworking 3.0

## Request failed: unacceptable content-type: text/html

因為網頁回傳值，出現了非預期的 content-type 格式 text/html

加入
```
manager.responseSerializer = [AFHTTPResponseSerializer serializer];
```

## 回傳格式無法讀取

請詢問回傳格式為何

若為 string
則將 nsdata 轉為 nsstring
```
NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
```


若為 json
則將 nsdata 轉為 json serial
```
NSError *error = nil;
id object = [NSJSONSerialization
             JSONObjectWithData:responseObject
             options:0
             error:&error];
    
if(error) { /* JSON was malformed, act appropriately here */ }
    
// the originating poster wants to deal with dictionaries;
// assuming you do too then something like this is the first
// validation step:
if([object isKindOfClass:[NSDictionary class]])
{
    NSDictionary *results = object;
    NSLog(@"%@",results);
    /* proceed with results as you like; the assignment to
     an explicit NSDictionary * is artificial step to get
     compile-time checking from here on down (and better autocompletion
     when editing). You could have just made object an NSDictionary *
     in the first place but stylistically you might prefer to keep
     the question of type open until it's confirmed */
}
else
{
    /* there's no guarantee that the outermost object in a JSON
     packet will be a dictionary; if we get here then it wasn't,
     so 'object' shouldn't be treated as an NSDictionary; probably
     you need to report a suitable error condition */
}
```