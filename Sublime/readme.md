## 環境
- mac osx 10.11.4
- sublime test 3

## 移除 sublime

- 透過 CleanMyMac3 移除檔案
- 檢查 `~/Application Support/Sublime Text 3` 是否存在，若存在則移除

## 安裝 sublime text 3

1. https://www.sublimetext.com/3
2. 輸入序號 : 開啟 sublime text 3，help -> Enter License 
	- crack : `https://gist.github.com/rockdrigo/de9a16a4c8d75d7acb32`

## 安裝 package control 的套件

- <https://packagecontrol.io/>
	- 此網站也會列出所有套件
		- Trending
		- New
		- Popular
		- Labels
- 按照指示安裝完畢後，會發現新增 `~/Application Support/Sublime Text 3`
- 開啟 sublime test 3，執行 `cmd+shift+p`，輸入 `pack...`，會看到 package control 已經被安裝，且會列出相關指令
- 使用 `package control : install package`，就會列出目前所有可安裝的 package


## Navi Feature

- Sublime Text

- File

- Edit

- Selections
	- `cmd+shift+l` : 先選擇範圍，按下該按鍵，再鍵入一些文字，即可知道效果
	- `cmd+d` : file 中，第一次按下，會選擇目前的 tag，再按一次，則會選擇到下一個相同的 tag 可以在該，可快速一次修改全部名稱

- Find

- View
	- `` ctrl+` ``
	- `cmd+ctrl+f` : 全螢幕
	- `cmd+ctrl+shift+f` : 專注模式
	- 編輯畫面切割(Split Editing) : View/Layout

- GOTO : `cmd+p` 在命令框架中
	- 輸入該 folder 中的檔案名稱，則會搜尋並檢視該 file，確認後可直接開啟。
	- 輸入 `@` 會列出目前 file 中的 symbols
	- 輸入 `#` 會列出目前 file 中的所有文字元件
	- 輸入 `:`+數字 可直接跳到該行

- Tools
	- 命令面板(Command Palette) : `cmd+shift+p`
		- `Package Control:`，透過安裝套件，會出現此命令，透過此命令列，可安裝與查詢套件
		- `Snippets:`，可快速建立語法片段
	- 可在此建立一些自訂的語法、片段、巨集
- Project
	- 管理 Project : 將個別不同的檔案，變成一組 project
	- 管理 Workspace : project 的集合


# cmd open sublime

`ln -s /Applications/Sublime Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`