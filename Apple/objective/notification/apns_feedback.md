[Binary Provider API](https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Appendixes/BinaryProviderAPI.html)

## 原理

當用戶卸載 app 時，如何去檢查用戶的 token 失效？  
(用戶重裝 app 時，token 也會變更)

1. 當用戶進行推播

- 正常程序: server -> apns -> device
- 用戶刪除: server -> apns x  device

2. 在刪除後，apns 無法推播給 device，此時 feedback service 就會記錄這些 token 的訊息
3. 故應看定時檢查，Feedback service 的列表，然後根據列表，刪除資料庫中，無效的 token
4. 從Feedback service讀取的數據結構如下：

	![img](https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/Art/aps_feedback_binary_2x.png)
	
	- Timestamp : apns 記錄無法推播的時間。

## 測試 php

- 先前準備，用 apns_dev.pem 推播給 device，再將該 device 上的 app 刪掉，再進行 feedback serive 的 array 取用。
- 注意：當取用 feedback service 一次後，記錄會消失，除非下一次 token 推播失敗後，才會再紀錄。
	- 目前測試，最常紀錄 30 分鐘，還可取到。

- code
	
	```
	stream_context = stream_context_create();
    stream_context_set_option($stream_context, 'ssl', 'local_cert', 'apns_pro.pem');
    stream_context_set_option($stream_context, 'ssl', 'passphrase', 'test');
    $apns = stream_socket_client('ssl://feedback.sandbox.push.apple.com:2196', $errcode, $errstr, 60, STREAM_CLIENT_CONNECT, $stream_context);
    if(!$apns) {
        echo "ERROR $errcode: $errstr\n";
        return;
    }


    $feedback_tokens = array();
    //and read the data on the connection:
    while(!feof($apns)) {
        $data = fread($apns, 38);
        if(strlen($data)) {
            $feedback_tokens[] = unpack("N1timestamp/n1length/H*devtoken", $data);
        }
    }
    fclose($apns);
    echo $feedback_tokens;
	```

- 回傳的 array 格式

	```
	Array
	(
	    Array
	    (
	        [timestamp] => 1266604759
	        [length] => 32
	        [devtoken] => abc1234..............etcetc
	    ),
	    Array
	    (
	        [timestamp] => 1266604922
	        [length] => 32
	        [devtoken] => def56789..............etcetc
	    ),
	)
	```

- array 取回範例結果

	```
	array(1) { 
		[0]=> array(3) { 
			["timestamp"]=> int(1456906409) 
			["length"]=> int(32) 
			["devtoken"]=> string(64) "1a6869c947894a9df0a0974bf149edd4ea841fd24544ccc7d00ed7c928cb4ead" 
		} 
	} 
	```