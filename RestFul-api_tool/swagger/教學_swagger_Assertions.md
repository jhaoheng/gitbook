# Swagger Assertions

https://github.com/Maks3w/SwaggerAssertions

## first
測試所有在 swagger.json 已描述過的 API requests and responses。
版本適合 swagger 2 spec definition。

※ 此工具只能根據你在 swagger definition 中，api 的 responses 驗證。無法進行驗證你的 swagger.json definition 到底是否正確。

## pre-required
- composer
- php-unit。

[第一次用 PHPUnit 寫測試就上手](http://www.openfoundry.org/tw/tech-column/9326-phpunit-testing)

## 安裝

- ```git clone```
- ```cd SwaggerAssertions```
- ```composer require fr3d/swagger-assertions```

## 使用
可參考 github 說明，利用 phpUnit 進行測試編譯。
可丟到 continue integration 進行持續測試。