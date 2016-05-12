# ios data storage guidelines

[官方](https://developer.apple.com/icloud/documentation/data-storage/index.html)
	- 更新 2016/03/05

本文說明apple官方對於iOS儲存資料的一些規範。  

## 環境
- xCode4.3.2 , ios5.1 , USE ARC

## overview
iCloud 已存在自動每天從Wi-Fi備份使用者的iOS device中的功能。任何存在于你app中的根目錄下的資料均會備份，除了應用程式本身有夾帶的bundle，cache目錄和temp目錄。可備份的包含『已購買的音樂、應用程式、書籍，相片、device的設定，主屏幕和app的組織，訊息和手機鈴聲也會備份』。


因是用無線（網路）備份的方式除存在 iCloud ，每份資料務必為最小儲存容量。容量較大的檔案將延長執行備份的時間，並消耗更多 iCloud 上可利用的空間。
確保備份的動作盡可能的有效率，確定將儲存在你app中的資料符合下列規範：

1. 只有用戶自主產生的資料或文件，或無法以其他的方式在app中重新創建的資料，應儲存在 <Application_Home>/Documents 路徑，並將自動備份到iCloud中。
2. 資料能被重復下載或者重復產生等，應被儲存在<Application_Home>/Library/Caches目錄。如應該把數據緩存文件和下載內容（如：雜誌、報紙和地圖應用），放在緩存目錄中。
3. 臨時的資料應該放在<Application_Home>/tmp目錄下，雖然這些文件不會被備份到iCloud中，但當不繼續使用這些資料時，請記得去刪除這些資料，以免佔去用戶設備的空間。
4. 使用"不要備份"屬性來指定那些需要保留在設備中的文件（即使是低存儲空間情況下）。那些能夠重新生成，但在低存儲空間時仍需保留，對應用正常運行有影響，或者用戶希望文件在離線時可用的文件，需要使用這個屬性。無論哪個目錄下的文件（包括Documents目錄），都可以使用這個屬性。這些文件不會被刪除，也不會包含在用戶的iCloud或iTunes備份中。由於這些文件一直佔用著用戶設備的存儲空間，應用有責任定期監控和刪除這些文件。

- 如何防止文件被備份到iCloud上，請參閱 
	- [How do I prevent files from being backed up to iCloud and iTunes?](https://developer.apple.com/library/ios/#qa/qa1719/)。
- For more information read the [iOS App Programming Guide](https://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/PerformanceTuning/PerformanceTuning.html#//apple_ref/doc/uid/TP40007072-CH8-SW8)

### More Information

To learn more about optimizing your app for iCloud, read Best Practices in the iCloud Programming Guide for Core Data and technical note: How do I prevent files from being backed up to iCloud and iTunes?

## 相關資料

- iOS 5.0.1開始支持"do not back up"文件屬性，允許開發者明確地指定哪些文件應該被備份，哪些是本地緩存可以自動刪除，哪些文件不需要備份但不能刪除。此外，對目錄設置這個屬性，會阻止備份該目錄和目錄中的所有內容。

- 注意"do not back up"屬性只能用於iOS 5.0.1以後版本。之前版本的應用需要存儲數據到<Application_Home>/Library/Caches目錄才能避免被備份。由於老的系統忽略這個屬性，你需要確保應用在所有iOS版本中，都遵循上面的iOS Data Storage Guidelines。

### 數據處理分類

com.apple.MobileBackup文件屬性就是iOS 5.0.1引入的"do not back up"特性，用於指定文件或目錄不需要備份（不管在文件系統的甚麼位置）。通過使用這個新的文件屬性，並且將文件存放在指定的目錄下，文件可以分為以下四種數據類型：

- 關鍵數據
	- 這些是用戶創建的數據，或其它不能重新生成的數據。應該存放在<Application_Home>/Documents目錄下，並且不應該標記為"do not backup"屬性。關鍵數據在低存儲空間時也會保留，而且會被iCloud或iTunes備份。

- 緩存數據
	- 可以重新下載或生成的數據，而且沒有這些數據也不會妨礙用戶離線使用應用的功能。緩存數據應該保存在<Application_Home>/Library/Caches目錄下。緩存數據在設備低存儲空間時可能會被刪除，iTunes或iCloud不會對其進行備份。

- 臨時數據
	- 應用需要寫到本地存儲，內部使用的臨時數據，但不需要長期保留使用。臨時數據應該保存在<Application_Home>/tmp目錄。系統可能會清空該目錄下的數據，iTunes或iCloud也不會對其進行備份。應用在不需要使用這些數據時，應該盡快地刪除臨時數據，以避免浪費用戶的存儲空間。

- 離線數據
	- 可以下載，或重新創建，但用戶希望在離線時也能訪問這些數據。離線數據應該存放在<Application_Home>/Documents目錄或<Application_Home>/Library/Private Documents目錄，並標記為"do not backup"屬性。這兩個位置的數據在低存儲空間時都會保留，而"do not backup"屬性會阻止iTunes或iCloud備份。應用不再需要離線數據文件時，應該盡快刪除，以避免浪費用戶的存儲空間。

### 設置Do Not Backup擴展屬性

注意："do not backup"擴展屬性可以添加到任何文件或目錄，在舊版本的系統中也能夠設置。但舊系統仍然會備份這些文件，一旦設備更新到iOS 5.0.1，這些文件會被重新正確地配置。

使用下面方法來設置"do not back up"擴展屬性。當你創建不需要備份的文件或目錄時，向文件寫入數據，然後調用下面方法，並傳遞一個文件URL。

設置擴展屬性

```
#include <sys/xattr.h>

- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
	const char* filePath = [[URL path] fileSystemRepresentation];
	
	const char* attrName = "com.apple.MobileBackup";
	u_int8_t attrValue = 1;
	
	int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
	return result == 0;
}	
```