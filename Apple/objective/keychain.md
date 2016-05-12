iOS Keychain Service
https://developer.apple.com/library/prerelease/ios/documentation/Security/Conceptual/keychainServConcepts/iPhoneTasks/iPhoneTasks.html#//apple_ref/doc/uid/TP30000897-CH208-SW1

Keychain Service Reference
https://developer.apple.com/library/prerelease/mac/documentation/Security/Reference/keychainservices/

## 說明

[apple doc](https://developer.apple.com/library/ios/samplecode/GenericKeychain/Listings/Classes_KeychainItemWrapper_h.html#//apple_ref/doc/uid/DTS40007797-Classes_KeychainItemWrapper_h-DontLinkElementID_9) - include sample code

1. 同一隻 app / bundle id ，可設定與取得相同的 key
2. 儘管刪除 app，也可以取得相同的 key
3. 其他 app 無法取得此 app 中的 key
4. 重設 app 後是否可取得相同的 key???

## 著名套件
[sskeychain](https://github.com/samsoffes/sskeychain)

## required

- security.framework