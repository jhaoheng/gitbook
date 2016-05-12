# Auto Layout Guide

## Introduction
Auto Layout 是一個可以讓你佈置你自己 app 的用戶介面，透過數學方法描述元素之間的關係。你可以定義這些限制條件下的關係，不管是在個別元素或者介於每組元素之間。Using Auto Layout, 你能夠建立動態、通用的介面，響應適當地改變螢幕尺寸，裝置旋轉與位置。

![img1](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/Art/autolayout_2x.png)

Auto Layout 在 Xcode5 內置介面生成器，可在 iOS 與 OS X 使用。當你產生一個新專案時，Auto Layout 預設為啟用。若你有既存的專案，並未使用 Auto Layout，可閱讀隨後的 Adopting Auto Layout 章節。

標準的利用流程圖產出用戶介面，可使用介面生成器可以建立、重新定位、重新調整 size、與客製化你的 views and controls。當你覺得滿意該位置與設定後，你可以準備加入 Auto Layout contraints 來幫助你的介面能夠自適應 旋轉、大小、與擺放位置。

## At a Glance

Auto Layout 在 Xcode 5 提供了強而有力的流程圖，讓你快速、簡單的產生與維護 constraint-based layouts 在 OS X 與 iOS apps. 在 Xcode5 中，你可以：

- 當你準備好時，加入 contraints。
- 快速加入 constraints 使用 control-drag 或者 menu options。
- 個別地更新 constraints 與 frames。
- 對動態的views，規定 placeholder constraints。
- 可直接發現、了解與解決問題，透過 conflicting constraints 或 不明確的介面。

## Organization of This Document
Read the following chapters to learn how to use Auto Layout：

- Auto Layout Concepts：學習關於當使用 Auto Layout 時，你需要知道的主要概念。
- Working with Constraints in Interface Builder：學習關於，使用 Interface Builder 來建立與編輯 layout constraints。
- Working with Auto Layout Programmatically：學習關於，利用 code 來使用 Auto Layout。
- Resolving Auto Layout Issues：學習關於，解決與識別 layout 上會遇到的問題。
- Auto Layout by Example：了解一般 Auto Layout 的使用範例。
- Implementing a Custom View to Work with Auto Layout：學習如何實現客製化介面，透過 Auto Layout 進行操作。
- Adopting Auto Layout：學習如何，在尚未使用 Auto Layout 存在的專案中，加入使用 Auto Layout 的做法。
- Visual Format Language：學習關於，用 code 來創建 constraints 的格式設定。