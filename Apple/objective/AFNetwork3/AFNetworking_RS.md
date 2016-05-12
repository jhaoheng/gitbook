# AFNetworking 3.0

在送出連線資訊前，要先設定送出的 request 長相，與內容參數
- GET
- POST
- JSON

## 產生 Request Serialization

`#import "AFNetworking.h"`

- 假設連線路徑與內容參數
```
NSString *URLString = @"http://example.com";
NSDictionary *parameters = @{@"foo": @"bar", @"baz": @[@1, @2, @3]};
```

- 設定 GET
```
[[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
```

顯示的格式為
> GET http://example.com?foo=bar&baz[]=1&baz[]=2&baz[]=3

- 設定 POST

```
[[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
```

顯示的格式為
> POST http://example.com/
> Content-Type: application/x-www-form-urlencoded
> foo=bar&baz[]=1&baz[]=2&baz[]=3

- 設定 json

```
[[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
```
顯示的格式為
> POST http://example.com/
> Content-Type: application/json
> {"foo": "bar", "baz": [1,2,3]}


## error

