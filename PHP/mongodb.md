
# centos
## 環境
php7
centos7

## 安裝 mongodb
1. yum install openssl-devel -y
2. wget http://pear.php.net/go-pear.phar
3. php go-pear.phar
4. vi `which pecl` => 拿掉 -n , 原因 https://serverfault.com/questions/589877/pecl-command-produces-long-list-of-errors
5. pecl install mongodb
6. echo "extension=mongodb.so" >> /etc/php.d/20-mongodb.ini
7. 驗證 php -m | grep mongodb

# mac os
## 環境
- osx
- php7.0.8
- mongodb 3.4.4
- php-mongodbClient 1.2.8

## 安裝 mongodb

1. `$ brew install mongodb`
2. 可在 `$ cat /usr/local/etc/mongod.conf`，看到 mongodb 設定
	- 注意位置 /data/db，確定是否存在，若不存在則建立一個，記得打開權限
3. `$ mongod` 啟動 mongodb

# 設定 php

1. `$ brew install php70-mongodb`
2. `$ cd /usr/local/Cellar/php70-mongodb` => 找到 mongodb.so
3. `$ php -i | grep extension` => 找到 extension 的位置
4. `$ mv mongodb.so {extension 位置}`
5. `$ php --ini` => 找到 php.ini
6. `$ vim php.ini`
	- 在 extension 中，加入 extension=mongodb.so
7. 驗證在 `$ php -i | grep mongo` 驗證版本應該跟下載的相同

## 當執行 mongo 提取資料時出現

```
dyld: lazy symbol binding failed: Symbol not found: _clock_gettime
  Referenced from: /usr/local/opt/php70-mongodb/mongodb.so
  Expected in: /usr/lib/libSystem.B.dylib

dyld: Symbol not found: _clock_gettime
  Referenced from: /usr/local/opt/php70-mongodb/mongodb.so
  Expected in: /usr/lib/libSystem.B.dylib
```
解決方法 : https://github.com/perftools/xhgui/issues/198#issuecomment-286711319

# 設定 MAMP

1. 一樣將 mongodb.so 拷貝到 mamp extension 的位置底下
2. 編輯 mamp 的 php.ini
3. 透過 phpinfo() 來檢查