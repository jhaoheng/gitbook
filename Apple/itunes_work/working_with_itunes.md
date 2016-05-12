## 官方 20160305

- [Create Links](https://www.apple.com/itunes/link/)

## Identity Guidelines

描述所有 友情連結的使用方式，包含圖像規則

- Apple Music
- iTunes Store Guidelines 
- iBooks Store Guidelines 
- App Store Guidelines

## 工具
- Create Apple Music Widgets
- Create Custom Widgets
	- 可直接設計妳的 website 頁面呈現，會產生一組 iframe
- Create Links
	- 依據指定的 app 產生一組 link
- Feature Top-Selling Content
	- 透過 rss 產生賣得最好與最受歡迎的 music / apps / books ....
- Affiliate Links Made Easy
	- 利用 snippet of javascript 加入到你的網站中，將自動轉換成 友情連結
- Create Banner Art Instantly
	- Create banners to feature on your website or app.
- Advanced Linking Tools
	- Search API : which allows you to build dynamic playlists inside the store
	- Collection Builder : which allows you to build dynamic playlists inside the store
	- Enterprise Partner Feed : provides an advanced data feed for the entire iTunes catalogue.

## overview

Search API 可用連結的方式，自己選定欄位，進行某個 app store/ iTunes Store/ iBook Store/ Mac App Store 產品的搜尋。

可以利用此方法，在你的 app / website 進行你的產品推廣，只需讀取 itunes 給你的 json 格式。

## search api

建立成功的 api 連接後，會得到一組 json 參數，搜尋到的參數都是 app store 上呈現的東西，無法得到該用戶是否已經評價，所以最好的方法就是，透過 iframe 產生，然後 丟給 web view，即可建立公版的畫面

- [search_api](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/)

1. itunes-store 搜尋標準格式如下
```
https://itunes.apple.com/search?parameterkeyvalue
```
parameterkeyvalue 可以是一個或者多個 key / value 的『參數』

```
key1=value1&key2=value2&key3=value3
```

若應用在網頁上

```
<script src="https://.../search?parameterkeyvalue&callback="{name of JavaScript function in webpage}"/>
```

搜尋 app store 範例

```
https://itunes.apple.com/search?term=andromoney&country=TW&media=software&entity=software&attribute=softwareDeveloper&lang=zh-TW&explicit=Yes
```

[Clean Links](https://affiliate.itunes.apple.com/resources/documentation/linking-to-the-itunes-music-store/)

```
http://itunes.apple.com/app/software/id850251209
```
## 從 app 中，跳到 app store，連結格式

- [inks to the App Store](https://developer.apple.com/library/ios/qa/qa1633/_index.html)

```
https://itunes.apple.com/us/app/keynote/id361285480?mt=8
```
- 如何從 app 中跳到 app store 請參考 [inApp_jump_appStore](inApp_jump_appStore.md)

### 關於 App Store Short Links

此為用比較短的方式連接到 app store，利用 `AppStore.com` 取代 `itunes.com`

主要分為兩個主體，iOS apps 與 Mac Apps

- Company Name
	- iOS: `http://appstore.com/<companyname>` for example, `http://appstore.com/apple`
	- Mac: `http://appstore.com/mac/<companyname>` for example, `http://appstore.com/mac/apple`
- App Name
	- iOS: `http://appstore.com/<appname>` for example, `http://appstore.com/keynote`
	- Mac: `http://appstore.com/mac/<appname>` for example, `http://appstore.com/mac/keynote`
- App by Company
	- iOS: `http://appstore.com/<companyname>/<appname>` for example, `http://appstore.com/apple/keynote`
	- Mac: `http://appstore.com/mac/<companyname>/<appname>` for example, `http://appstore.com/mac/apple/keynote`

### 規則
為了產生正確的連接，<companyname>與<appname>需遵照幾個規則

- Remove all whitespace
- Convert all characters to lower-case
- Remove all copyright (©), trademark (™) and registered mark (®) symbols
- Replace ampersands ("&") with "and"
- Remove most punctuation (See Listing 2 for the set)
- Replace accented and other "decorated" characters (ü, å, etc.) with their elemental character (u, a, etc.)
- Leave all other characters as-is.

以下字符必須移除
```
!¡"#$%'()*+,\-./:;<=>¿?@[\]^_`{|}~
```

### 範例

1. Company Name EX
	- Gameloft => http://appstore.com/gameloft 
		- 全部小寫
	- Activision Publishing, Inc. => http://appstore.com/activisionpublishinginc
		- 全部小寫且捨棄空白與字符
	- Chen's Photography & Software => http://appstore.com/chensphotographyandsoftware
		- 全部小寫且捨棄字符且將 & -> and
2. App Name EX
	- Ocarina => http://appstore.com/ocarina
		- 全部小寫
	- Where’s My Perry? => http://appstore.com/wheresmyperry
		- 全部小寫、捨棄字符與空白
	- Brain Challenge™ => http://appstore.com/brainchallenge
		- 全部小寫、捨棄字符與空白、捨棄特殊符號

## 參數

請參考網頁

所以 app 應該分為兩類
一個是 rate 
一個是 顯示自己的 app

