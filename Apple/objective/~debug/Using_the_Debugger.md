# Using the Debugger

[source page](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/UsingtheDebugger.html#//apple_ref/doc/uid/TP40010215-CH57-SW1l)

![img1](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/XC_O_DebugFeatures_2x.png)

主要分為三塊

- Debug navigator：告知現在 code 運行狀況
- Source code editor：
- Debug area：分為左右兩塊，左邊為各參數的變化，右邊為 log 的輸出。

一個有品質的 app 必須對用戶的系統影響最小，使用 debug gauges 去獲取 app 的資源消耗，當你發現一個問題，就可以用 Instruments 來量測與分析 app 的效能。使用 energy guides 來改善電量狀態。[Energy Efficiency Guide for iOS Apps](https://developer.apple.com/library/ios/documentation/Performance/Conceptual/EnergyGuide-iOS/index.html#//apple_ref/doc/uid/TP40015243)

若開發 iOS 與 watchOS app，使用 simulator 去找到問題的根源並且做好測試。

可以設定 Xcode 來幫助你專注在你的測試任務中。ex：當你的代碼碰觸到你設定的 breakpoint，你可以讓 Xcode 自動的播放一個提示音與開啟目前 Debug 的視窗，在你設定的 breakpoint 上，Xcode 會展示 debug area / debug navigator / code。

## Controlling Execution
Xcode 中，debug area 會幫助你一行一行的執行你的 code，用來觀看變數與暫存器間的變化。你也可用 debug area 來導覽 OpenGL 的呼叫。

![img](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/XC_O_DebugArea_2x.png)

在你的 xcode 中，上方 toolbar 中的右方，有個 按鈕，按下後會開啟 debug area。  

在 debug view 中的 toolbar 中，你可以利用 暫停/執行 的按鈕，來執行你的 code 中的 breakpoint。breakpoint 有許多狀態的設定方法，可以參考 [Breakpoint Navigator Help](https://developer.apple.com/library/ios/recipes/xcode_help-breakpoint_navigator/_index.html#//apple_ref/doc/uid/TP40010433)

當你的 app 暫停時，執行中的 code 會用綠色高亮狀態。你可使用 『step over』、『step into』、『step out』 按鈕來協助你 debug。

- step over : Step over will execute the current line of code, including any methods. If the current line of code calls a method
- step into : starts execution at the current line, and then stops when it reaches the first line of the called method
- step out : executes the rest of the current method or function.

## Viewing State Information

當 breakpoint 執行時，debug navigator 會展示目前的 stack trace。可在 debug navigator 中選擇一個項目，該 item 的相關資訊會展示在 debug area 與 editor area。如下圖

![img3](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/DebugNavigator_2x.png)

將你的滑鼠，移動到 source code 中的任何一個變數中，可以看到相關的資料並展示該變數當下的數值。  
在此中，有兩個按鈕![](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/QuickLookInspectorIcon_2x.png)/![](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/QuickLookVarIcon_2x.png) 顯示用途如下兩張圖所示

![img4](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/DataTipInspector_2x.png)

![img5](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/DataTipQuickLook_2x.png)

## Finding Memory Corruption

記憶體的損壞造成的 crash 很難重現，甚至很難被找到。Address sanitizer 的檢測可以被添加到你的 app 中，若 Xcode 執行中，發生記憶體損壞，就會在損壞的地方停止應用程序。
Address sanitizer 會針對

- accessing deallocated pointers
- buffer overflow
- underflow of the heap and stack, and other memory issues.

### 開啟方法

如下圖
![](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/Address_Sanitizer_enable_2x.png)

more information: [Using the Address Sanitizer](https://developer.apple.com/library/ios/documentation/DeveloperTools/Conceptual/debugging_with_xcode/chapters/special_debugging_workflows.html#//apple_ref/doc/uid/TP40015022-CH9-SW23)

## Debugging Metal

Metal 是一種工具，可以使用 matal 來加速 繪圖 與 運算。

- [Metal Tips and Techniques](https://developer.apple.com/library/ios/documentation/Miscellaneous/Conceptual/MetalProgrammingGuide/Dev-Technique/Dev-Technique.html#//apple_ref/doc/uid/TP40014221-CH8)

- [Metal for Developers](https://developer.apple.com/metal/)
- [Metal Programming Guide](https://developer.apple.com/library/ios/documentation/Miscellaneous/Conceptual/MetalProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40014221)


## Debugging OpenGL

當使用 OpenGL ES，透過 debug area toolbar 的 Fram Capture 按鈕![](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/CaptureFramebutton.png)，點擊該按鈕，可以抓取：

- Inspect OpenGL ES state information
- Introspect OpenGL ES objects such as view textures and shaders
- Step through the state calls that precede each draw call and watch the changes with each call
- Step through draw calls to see exactly how the image is constructed
- See in the assistant editor which objects are used by each draw call
- Edit shaders to see the effect upon your app



![](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Art/gputrace-after_2x.png)