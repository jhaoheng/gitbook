## db

- `$user->save();` 寫入資料庫兩次
	- 原因為 favicon 沒有設定，造成 index.php 被呼叫兩次
	- <https://forum.phalconphp.com/discussion/8677/volt-syntax-for-favicons>

## Validator

原因 2.x -> 3.0 版本問題，改為

```
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
```