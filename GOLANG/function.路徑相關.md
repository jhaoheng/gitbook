1. 在同一個資料夾中的 func，可隨意呼叫
2. 若要引用其他資料夾的 func，須遵循以下設定
	1. 設定好你的 GOPATH，因為在 import 中引入的 folder 會以 GOPATH 當 base
	2. 建立 folderName 下的 fileName.go
		- package 設定為 folderName
		- funcName 記得開頭為大寫
	3. 在 main.go 中 
		- import 輸入相對路徑, ex: import "baseFolderName/funcFolderName"
		- 使用 func, "folderName.funcName()"