## 目的
在同一台主機下，建立 config，並指定哪一台 host 主機，指定使用哪一隻金鑰

## mac 路徑
```
cd ~/.ssh
```

## 建立分類目錄
```
mkdir 'category_name'
```

## 產生金鑰並放入該分類目錄中
```
ssh-keygen -t rsa -C "youremail@email.com"
mv 'keyName' 'category_name'
```

## config 設定
在 .ssh/ 的路徑下，建立 config，無需副檔名，其內容範例為

```
# Example:
# Host //主機名稱
# HostName //域名或ip
# User //用戶名稱
# IdentityFile //ssh key 路徑
```


正式範例

```
# github(yourMail@mail.com) 為了一覽
# Host github.com
# HostName github.com
# User git
# IdentityFile ~/.ssh/'category_name'/'keyName'
```

## 測試
將該 public key 放入 github 中後，ssh clone 下來即可