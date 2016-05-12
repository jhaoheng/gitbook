https://mixpanel.com


## first
註冊完畢
進行第一次設定
js 中有 token
將此 js 放入 html 中，並將 track 設定好，可於下方進行測試，完成後，即可進行下一步
**我個人覺得，可能多數人在第一次使用時，遇上了問題，所以 Mixpanel 才會如此進行他的流程**

若直接在 settings 中 Reset Project Data，則不會影響 token 的變更，只需重新在 Segmentation 中重新初始化一遍即可

## settings
- Management
	- 專案名稱設定
	- URL
	- 時區設定
	- Data points : That simply means that you have sent in any events, [You can send in events using track method](https://mixpanel.com/help/reference/javascript#sending-events)
	- Number of users : set up any user people profiles, [set up profiles using people.set method](https://mixpanel.com/help/reference/javascript#storing-user-profiles)
	- Token
	- API Secret
	- Options
		- reset
		- delete
		- transfer
- Team
	- 團隊管理
- Notifications
	- 可上傳設定 GCM(API Key) / APNS(p12) 的憑證
- Data Management
	- 管理 event 與 properties 中的參數，何者不需要被監控
- Access security
	- 可啟用二階段驗證 

## 基本：五個關鍵指標
Acquisition, Activation, Retention, Referral, and Revenue.

- 用戶從何處知道了此服務，開發者在這些服務來源中，了解到用戶從哪些地方知道此服務，在行銷上就可強化該服務，可能是一個電影的廣告...等等
- 並進行了註冊
- 用戶持續的使用
- 透過用戶進行病毒式的行銷
- 從這些廣大的用戶中，瞭解哪些用戶是金童，並瞭解他們的喜好

當服務建立好後，先從第一步放置追蹤代碼，等到部署到第三步，就可不斷的循環找尋痛點，取得第五步的收益
至於第四步，若讓用戶已經很喜愛你的產品，即可使用第四步進行行銷，若尚未保證用戶對產品有一定的認同度，結果只是招來一堆蒼蠅罷了

以前錯誤的例子：

- err_1 : 以為只要放到 fb，就會有一堆粉絲
- err_2 : 無腦的直接使用病毒式行銷，希望透過 fb 的 share 進行推廣產品的可見度
- 結論：無法取得用戶的回流，且可見度也有限，做了一堆無用的工


### Acquisition
泛指強調獲取資訊的方法
獲取用戶是從哪些位置或者說是來源，給予你有價值的回饋 = 表現最好的轉換通道
強化這些來源

可從這些來源中，取得開發團隊要取得的資訊，如年齡、性別、地域性
並且可進一步的分析，是哪些搜尋關鍵字，讓你知道誰是你的客戶群

### Activation
> happy first visit.
> Do they move through your app or website seamlessly?
> Are there certain pages or steps where you are losing or stalling a chunk of your traffic?
> key goal of increasing conversion.

激活用戶，進行註冊等等
讓這些用戶從了解到你的服務，倒變成你真正的註冊用戶

不斷的優化 landing page，讓用戶無論從 app or website 的轉換過程中，是流暢的
並且了解到用戶在第一次的接觸中，會想要進行註冊，並觀察是否在某一流程中，用戶

進行註冊的用戶，將會取得一組 distinct_id，這將會是 mixpanel 進行分析用戶資料的判斷

### Retention

簡言：回流率

當你讓一些陌生人，變為你網站的客戶，你並需讓他們經常性的回流到你的網站

The key to monitoring changes in retention is to view it by cohort groups.
Q:This is all well and good, but how do I get my retention to go up

舉例：
可以指定在過去兩個星期中，尚未登入網站，並曾於過去多次購買的用戶，讓他們知道你在舊金山有辦活動
之後使用 funnel 去觀察，這些用戶是否通過通知有回到你的網站，或者讓這些用戶帶來更多的效益

讓你的用戶經常性地回到你的服務中
ex : 透過某些行銷行為，讓這些用戶感興趣，並且回到你的服務中

### Referral
> Once your product is battle-tested and beloved, it's time for viral marketing.
> how many of your users send invites, and what percentage of those invites become new users.

以下為用戶 A 邀請用戶 B 成為會員的追蹤(必須要學會描述故事，在此前提先畫出 flow) `mixpanel.track("event", {"distinct_id": "Other ID"});`
(必須著重在，A 與 B 之間的對話方式)

![img](http://mpdocs.s3.amazonaws.com/images/dual%20virality%20events.png)

**distinct_id 是讓 mixpanel 可辨別的清晰的代碼**

如何跟蹤發送邀請與接收邀請的比例的轉換數
跟蹤工具，應該是說，因為推廣，可觀察到哪些推廣代碼，被引用，並且成功轉換為用戶

- K-factor : http://en.wikipedia.org/wiki/K-factor_(marketing)
	- 用於描述網站或者 app 的增長速度
	- k = i * c ; i 為每個用戶寄送的邀請數量 ; c 為轉換為新用戶的預測百分比
		- ex : i=5 ; c=.2 ; k=1，若 k>1 則代表正成長， k<1 則代表負成長
	- 透過 mixpanel，可觀察到哪些 user 對於推廣有助
- mixpanel.people.increment
	- 可觀察到，哪些事件對於推廣是有助益的


例如可在 mail 中，url 的參數放入邀請者的 id 或者可將整個事件的 json 轉為 base64 掛於 url 後方

```
//將 json 轉為 base64
http://api.mixpanel.com/track/?data=ew0KICAgICJldmVudCI6ICJTaWduZWQgVXAiLA0KICAgICJwcm9wZXJ0aWVzIjogew0KICAgICAgICAiZGlzdGluY3RfaWQiOiAiMTM3OTMiLA0KICAgICAgICAidG9rZW4iOiAiZTNiYzQxMDAzMzBjMzU3MjI3NDBmYjhjNmY1YWJkZGMiLA0KICAgICAgICAiUmVmZXJyZWQgQnkiOiAiRnJpZW5kIg0KICAgIH0NCn0=
```

```
//將 json 轉為 base64，json 格式
// Sends an event "Signed Up", associated with user 13793,
// with a property "Referred By"
{
    "event": "Signed Up",
    "properties": {
        // "distinct_id" and "token" are
        // special properties, described below.
        "distinct_id": "13793",
        "token": "e3bc4100330c35722740fb8c6f5abddc",
        "Referred By": "Friend"
    }
}
```

[mixpanel http 參數設定](https://mixpanel.com/help/reference/http)

### Revenue
以上的四個方法，都只是為了最後的收益

當你透過以上方法了解到，哪些是最有價值的用戶，就可以針對這些用戶的喜好進行開發、行銷推廣
例如:可以知道，18 歲的青少年，21 歲的女性，在你的 app 中進行了哪些購買，
針對這些有價值的客戶群，進行特別的推廣活動，讓你的行銷更為精準


## 一些簡單的樣版規則
http://mpdocs.s3.amazonaws.com/docs/Sample%20Mixpanel%20implementation%20Spec%20with%20People.xls

## 區隔 develop / production 的設定

1. 在 mixpanel 控制台中，建立兩個專案，分別為 develop 與 production，此時根據會產生個別的 token
2. 當在 website 時，透過 js，檢查 host 是否為 productionHost

```
var productionHost = 'Your production Domain'; 

var devToken = 'Development Token';
var prodToken = 'Production Token';

/* If the hostname is anything other than your production domain, initialize the Mixpanel library with your Development Token */

if (window.location.hostname.toLowerCase().search(productionHost) < 0) {
    mixpanel.init(devToken);
} else {
    mixpanel.init(prodToken);
}
```

3. 同理在 ios / android 亦可參照類似方法