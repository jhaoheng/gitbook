# 安裝 mosquitto.so

1. `brew install autoconf`
2. 引入正確的頭文件
	
	```
	cd /Applications/MAMP/bin/php/php7.0.8
	ln -s /Application/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.xx.sdk/usr/include/ include
	```
3. 安裝
	
	```
	cd /Applications/MAMP/bin/php/php7.0.8/bin
	./pecl install mosquitto-beta
	```
	
4. 設定 extension，可透過 MAMP 直接開啟 php.ini 也可透過 vim php.ini 設定

	```
	cd /Applications/MAMP/bin/php/php7.0.8/lib/php/extensions/....  找到 php.ini
	搜尋 extension
	加入 extension=mosquitto.so 即可
	```

# check 
phpinfo();

# use

github : mosquitto-php 

# trouble-shooting

1. 注意 homebrew 的 php 版本會影響 mamp 的 php compile
2. 在 ./pecl 執行後，在 log 中，確定 phpize 在執行時，抓取 php.h 的位置
	- 如果失敗
	- `brew uninstall phpxx` 
	- `ln -s /Applications/MAMP/bin/php/php7.0.8/bin/* /usr/local/bin/`