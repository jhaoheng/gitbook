# 20160301

## 環境
xcode 7.2.1
ios 9.2

## 建立
1. 開啟一個專案
2. 在 target 中新增
3. 選擇 application extension -> Today Extension
4. 選擇 scheme activate

## 建立互相溝通的橋樑

widget 只是一種 app 中的延伸，所以必須設定 app group，讓兩者互相溝通

1. 先去 develop center 中設定好 bundle id，並開啟 app groups 的服務。
2. 將 app 中，設定好 <bundle id>，在 widget 中設定 <bundle id>.<widget name> 
3. 在該專案的 app 中（非 widget），選擇該 target，點選 Capabilities，找到 app groups，設定為 ON
4. 新增一個 group:`group.maxdemoSharedDegaults`，確定有打勾
	- 注意：當你新建立一個 group，develop center 的 identifier 就會新增一組 widget 專用的 bundle id 
5. 切換到 widget 中的 target，一樣選擇 capabilities -> app groups -> 勾選剛剛建立的 group

## coding 額外設定

- **預設的 widget 使用 storyboard**，這邊改用 coding 作法
- 建議還是依照 storyboard 的做法

1. 找到剛建立的 widget，選擇 info.plist
2. 在 NSExtension 中，可找到 NSExtensionMainStoryboard，刪除
3. 在 NSExtension 中，新增 NSExtensionPrincipalClass，並設定 TodayViewController(此名稱根據 widget 建立時設定而定)
4. 若使用 coding 的方式建立 widget view，則必須要設定高度

	```
	//TodayViewController / viewDidLoad
	self.preferredContentSize = CGSizeMake(5, 10);
	//5:最低寬度，只要超過這個寬度，畫面才有最小預設寬度，應該是個 bug
	//10:這是高度，看需求設定
	```

### 測試
1. 在 TodayViewController.m -> viewDidLoad，新增

	```
	UIView *viewBlock = [[UIView alloc] initWithFrame:self.view.frame];
    viewBlock.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewBlock]
	```
	
2. compile...`today->device`



## error 

出現

```
The operation couldn’t be completed. 
(LaunchServicesError error 0.)
```

解決 : 重構 app
