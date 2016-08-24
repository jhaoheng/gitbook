# osx app

## Target

1. 用戶點開 .dmg
2. 拖曳 app -> application
3. 點開 application
4. 在 navigation bar 上，顯示功能列
	- start
	- stop
	- exit

## folder
https://developer.apple.com/library/mac/documentation/General/Conceptual/MOSXAppProgrammingGuide/AppRuntime/AppRuntime.html#//apple_ref/doc/uid/TP40010543-CH2-SW1

- Applications directory
- Home directory
- Library directory

## core

放入 c++ code


## exec

- start : excute core c++
- stop : excute core c++
- exit : close app

## OS X Human Interface Guidelines

- Menu
	- Menu Bar Extras

	
# 學習

- key word : mac app tutorial
- [如何建立 sys menu bar](http://howto.oz-apps.com/2013/04/creating-menubar-menu-mac-osx-using.html)
- button : NSButton
	- https://developer.apple.com/library/mac/documentation/UserExperience/Conceptual/OSXHIGuidelines/ControlsButtons.html
- 修改 window controller scene title
	- Attributes inspector 修改

## 在 dock 中隱藏
https://developer.apple.com/library/mac/documentation/General/Reference/InfoPlistKeyReference/Articles/LaunchServicesKeys.html
於 plist 中，設定 Application is agent (UIElement) = YES

## launch 不顯示 main window
storyboard -> select window controller -> attributes inspector -> 取消 is initial controller

## 設定 sys status menu

## view 

- 置中
	- 點選物件 -> Align 
		- [x] Horizontally : 無需設定參數
		- [x] Vertically  : 無需設定參數