其中使用 `NSURLConnection` 的 `sendSynchronousRequest:` 在 ios9 被捨棄使用
```
//http post方法,送出資料給server
- (NSMutableDictionary *)httpPostDic:(NSMutableDictionary *)__postDictionary urlStr:(NSString *)urlStr
{
    
    //完整的dictionary
    [__postDictionary setObject:@"object" forKey:@"exampleKey"];
    NSLog(@"post出的資料:%@",__postDictionary);
    //
    
    NSData *__jsonData = [[NSData alloc]init];
    if([NSJSONSerialization isValidJSONObject:__postDictionary]){
        //NSLog(@"%@",infoArray);
        NSError *jsonError = [[NSError alloc]init];
        __jsonData = [NSJSONSerialization dataWithJSONObject:__postDictionary options:NSJSONWritingPrettyPrinted error:&jsonError];
    }else{
        NSLog(@"發生錯誤");
    }
    
    //http request
    NSURL *url = [[NSURL alloc]initWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: __jsonData];
    //設定 http 相關
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%ld", [__jsonData length]] forHTTPHeaderField:@"Content-Length"];
    
    NSError *errorReturned = nil;
    NSURLResponse *theResponse =[[NSURLResponse alloc]init];
    
    //送出
#warning ios9 捨棄使用
    NSData *response_data = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&errorReturned];
    
    //取得回應
    NSMutableDictionary *jsonArray = [[NSMutableDictionary alloc]init];
    if (errorReturned) {
        // Handle error.
        NSError *jsonParsingError = nil;
        jsonArray = [NSJSONSerialization JSONObjectWithData:response_data options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&jsonParsingError];
    }
    else
    {
        NSError *jsonParsingError = nil;
        jsonArray = [NSJSONSerialization JSONObjectWithData:response_data options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:&jsonParsingError];
        
    }
    return jsonArray;
}
```