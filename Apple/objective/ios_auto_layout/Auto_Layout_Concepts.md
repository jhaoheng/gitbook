# Auto Layout Concepts

Auto Layout 的基本架構 block 就是 constraint。Contraints 是專門對介面上的元素佈局而制定規範。像是，你可以建立一個 constraint，特別指定某個元素的寬，或者他的水平位置與跟其他元素的距離。你可以新增、移除 constraints 或者改變 constraints 的設定，來影響你介面上的佈局。

當計算一個位於用戶介面上元素的運行位置時，Auto Layout 系統同時會考慮所有的 constraints 設定，用最滿足所有 constraints 的條件設定元素位置。 

## Constraint Basics

你可以想像，constraint 就像是用數學表示對於一個人的描述。假如你對一個按鈕的位置下定義，如，你可能會說 “左邊緣應該有 20 points，從包含他的左邊緣的視圖上存在 20 points”。更正式的說，這可轉變為 button.left = (container.left + 20)，反過來的表示式為 y = m*x + b，其中：

- y 與 x 為畫面上的的屬性參數。
- m 與 b 是具有小數點的數值變數。

其中屬性參數為：left, right, top, bottom, leading, trailing, width, height, centerX, centerY, baseline。

The attributes leading and trailing are the same as left and right for left-to-right languages such as English, but in a right-to-left environment such as Hebrew or Arabic, leading and trailing are the same as right and left. When you create constraints, leading and trailing are the default values. You should usually use leading and trailing to make sure your interface is laid out appropriately in all languages, unless you’re making constraints that should remain the same regardless of language (such as the order of master and detail panes in a split view).

Constraints 的其他屬性設定：

- Constant Value：以點計算實質上大小與位移的 constraint。
- Relation：Auto Layout 支持更多不僅僅為試圖屬性的常數值; 你能使用關係和不等式，譬如 >=。如，該視圖的寬度 >= 20 或者 textview.leading >= (superview.leading + 20)。意指 textview 的 leading 要 >= superview 的 leading + 20 的判斷。
- Priority level：Constraints 有優先權的存在。Constraints 利用高優先等級會先得到滿足 比之 constraints 優先權較低者。默認的優先等級為必須（NSLayoutPriorityRequired），這意指每一個 constraint 至少都會有默認狀態的設定。這代表著儘管不能全部實現每一個 constraints，但系統會盡可能的接近他可能滿足的一個 optional constraint。

Priority levels 允許用戶自定當下的情境行為進行安排。如，常理來說物件用 constraints 來調整自己的大小，基於他們的內容物去調整，除非有更重要的東西被考慮進去。For more information about priority levels, see NSLayoutPriority.

Constraints 是累積持續性的，他們不能取代彼此。如果你有一個現有的 constraints，設置另一個相同類型的 contraints 並不會覆蓋前一個。如，設定第二個 寬度上的 constraints 對一個 view，並不會移除或者修改第一個 寬度上的 constraints，你需要先手動刪除第一個 constraints 才可以進行第二個 constraints 的設定。 

Constraints 能，在限制下，跨越不同的視圖層。In the Mail app in OS X, for example, by default the Delete button in the toolbar lines up with the message table; in Desktop Preferences, the checkboxes at the bottom of the window align with the split view pane they operate on.

You cannot set a constraint to cross the view hierarchy if the hierarchy includes a view that sets the frames of subviews manually in a custom implementation for the layoutSubviews method on UIView (or the layout method on NSView). It’s also not possible to cross any views that have a bounds transform (such as a scroll view). You can think of such views as barriers—there’s an inside world and an outside world, but the inside cannot be connected to the outside by constraints.

## Intrinsic Content Size

## Application Architecture

### The Role of the Controller 