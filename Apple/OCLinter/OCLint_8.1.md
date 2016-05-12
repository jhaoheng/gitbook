# OCLint 8.1

[link](http://docs.oclint.org/en/dev/intro/installation.html)

## Download
http://docs.oclint.org/en/dev/

## Installation
- 安裝: oclinter，照官網說明即可


## 與 xcode 結合

可選擇用以下兩種與 OCLint 結合
- xcodebuild 
- xctool

使用 xocdebuild
- 安裝: xcodebuild，執行前，必須先確定自己的憑證是否正確

驗證 xocdebuild
- 確定可 執行產生 log : xcodebuild | tee xcodebuild.log
- 確定可 執行 : oclint-xcodebuild，產生 compile_commands.json  


注意當使用範例文本 bash 時
要注意你的 oclint 的來源位置
http://stackoverflow.com/questions/30052686/oclint-not-in-system-path

## 使用注意

- No white spaces in file name and path
	- 當使用 oclint-JSON-compilation-database 與 oclint-xcodebuild 建立時，檔名的空格，會產生問題。