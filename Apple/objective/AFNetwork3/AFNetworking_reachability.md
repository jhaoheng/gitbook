# AFNetworking 3.0

## Reachability

跟 apple reachability 的用途一樣
`#import "AFNetworking.h"`


- block : 透過此 block 可獲得目前網路狀態的監控 `AFStringFromNetworkReachabilityStatus` 共四種

	```
	[[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
    NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
	}];
	```

- 啟用監控

	```
	[[AFNetworkReachabilityManager sharedManager] startMonitoring];
	```
		
- 判斷是否有連線

	```
	- (BOOL)connected {
    return [AFNetworkReachabilityManager sharedManager].reachable;
	}
	```	

## example

```
//設定反饋
[[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];

//啟動
[[AFNetworkReachabilityManager sharedManager] startMonitoring];
```

- 獲取目前的連線狀態

```
- (BOOL)connected {
	
//    NSLog(@"%ld",(long)[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus);
    return [AFNetworkReachabilityManager sharedManager].reachable;
}
```