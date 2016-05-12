## uuid
The NSUUID class creates UUID strings that are to uniquely identify types, interfaces, and other items.

UUIDs (Universally Unique Identifiers), also known as GUIDs (Globally Unique Identifiers) or IIDs (Interface Identifiers)

NSUUID 通常用來將 idfv , adid...等等 uuid 轉成 uuidString

## identifierForVendor

```
NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
```

此為 ios6 禁用 udid 後，可以使用的唯一識別符

[官方文件](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDevice_Class/#//apple_ref/occ/instp/UIDevice/identifierForVendor)

文件中描述，當你在開發時（未上架至 app sotre），identifierForVendor 將會依照你設定的 bundle id 給予你一組
『供應商代碼』，若上架到 app store，則為 app store 提供。  

**相同的 供應商，提供的 app，安裝在相同的 device 上，得到的 vender id 為相同** 
  
至於何時會相同？
> 當用戶刪除掉該開發商的所有 app，則 identifierForVendor 在下次下載後，會有所不同  
> 當用戶保留其中一個 app，而再下載其他 new app 時，該 new app 的 identifierForVendor 會與舊的相同  
> 如果要保存，唯一方法，存在 keychain

當系統還原、升級會改變

## adid(advertisingIdentifier)

```
NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
```
[官方文件](https://developer.apple.com/library/ios/documentation/AdSupport/Reference/ASIdentifierManager_Ref/index.html#//apple_ref/occ/instp/ASIdentifierManager/advertisingIdentifier)

> 不像 **identifierForVendor，只要是相同的供應商，id 都會一樣**，這 id 會改變在，當用戶重設，所以你不該 cache 此 id。  
> 若該數值 nil，請等待一會兒。這種情況發生在當裝置剛重新啟用前，用戶尚未 unlocked 他的裝置。  

保存性：
> advertisingIdentifier 會在下列兩種情況下不同：  
> 1. 當用戶將全系統 reset (Settings -> General -> Reset -> Reset All Content and Settings)  
> 2. 當用戶自動重設 advertisingIdentifier (Settings -> Privacy -> Advertising -> Reset Advertising Identifier)

升級系統，該值不會改變。還原會改變

## gus(globallyUniqueString)

```
NSString *gus = [[NSProcessInfo processInfo] globallyUniqueString];
```

用此方法來產生唯一的識別符，在此程式中，可用來當作臨時緩存檔案的名稱