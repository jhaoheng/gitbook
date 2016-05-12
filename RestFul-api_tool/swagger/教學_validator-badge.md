# validator-badge

https://github.com/swagger-api/validator-badge

![img1](https://camo.githubusercontent.com/f23a0115c7bc5177b0c79fca6686ba0537d8f48f/687474703a2f2f6f6e6c696e652e737761676765722e696f2f76616c696461746f723f75726c3d68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f737761676765722d6170692f737761676765722d737065632f6d61737465722f6578616d706c65732f76322e302f6a736f6e2f70657473746f72652d657870616e6465642e6a736f6e)

## first
這是一個驗證你的 swagger.json 中，驗證 schema 是否可被正確讀取，是否有錯誤。 
無法驗證你的 api response 是否可被測試。

## 使用

可用官方線上驗證

- json 需可被讀取，且正確
- DNS 需可被官方讀取

也可自己 clone 下來進行本地端驗證

- 必須進行本地端的連接

## 錯誤顯示

- 若 schema 錯誤，則 invalid
	- ![img1](img1.png)
- 若 swagger.json 無法驗證，則 error 
	- ![img](img2.png)