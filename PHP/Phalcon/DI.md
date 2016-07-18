# Dependency Injection/Service Location

- `Phalcon\Di` 是一個實現 `Dependency Injection/Service Location` 的組件，而且它本身就是一個裝載它們的容器。
- 透過 `Phalcon\Di` 可以註冊許多的服務，放在 Di 中，也可以透過 Di 進行傳遞參數的行為
	- 可以很容易的使用自己建立的組件，或者第三方組件，還有進行替換的動作
		- ex : 替換掉 db 的 config 連線資訊
	- 支援『延遲加載』：主要就是等到需要用到的時候，才會進行加載的行為，使用方法可參考官方文件
- 可在 Class `Phalcon\Di\FactoryDefault` 中查看 methods
- FactoryDefault 是延伸 class `Phalcon\Di`，所以也可以從 Phalcon/Di 中自己建立自己的 Di
- FactoryDefault 作為一個 Di 的延伸，並且預載了許多已經加入過的服務

## 初始化 Di

- 初始化後，才可以使用 Di set 與 get
```
use Phalcon\Di
$di = new Phalcon\Di();
```

- 初始化後，若要在 mvc 或者其他的控制器中使用該 Di 
	- ex1 : MVC，可用 phalcon-devtools 建立一個 Scaffold 可看到範例
	  	- `$application = new \Phalcon\Mvc\Application($di);` 
	    - 並 `echo $application->handle()->getContent();`

## 註冊服務

- 第一種
	
	```
	$di->set('request', 'Phalcon\Http\Request');
	```
- 第二種
	
	```
	use Phalcon\Http\Request;
	$di->set('request', new Request());
	```
	
- 第三種：通過外部參數 `$config` 變更 di 中的設定。透過 use 協助

	```
	use Phalcon\Db\Adapter\Pdo\Mysql as PdoMysql;

	// 把當前域的$config變量傳遞給匿名函數使用
	$di->set("db", function () use ($config) {
	    return new PdoMysql(
	        array(
	            "host"     => $config->host,
	            "username" => $config->username,
	            "password" => $config->password,
	            "dbname"   => $config->name
	        )
	    );
	});
	```
- 其他還有 : 範例至官方參考
	- 如果要求不用實例化/解析服務，就可以改變定義服務的話，我們需要使用數組的方式去定義服務。
	- Constructor Injection
	- Setter Injection
	- Properties Injection

- 所有的都是服務註冊，有比較簡易的註冊方式，也有複雜（詳細）的設定方法

## 從 di 中取回服務

- 在 di 中設定好 request
	
	```
	$di = new Phalcon\Di();
	$di->set("request", 'Phalcon\Http\Request'); // 第一個參數是『類別名稱』，第二個是『definition』
	// use Phalcon\Http\Request; 使用這兩種方式建立服務也行
	// $di->set("request", new Request()); 
	```
	
- `<?php $request = $di->get("request");` or `$request = $di->getRequest();`
- 通過容器的方式傳遞參數
	
	```
	$component = $di->get("MyComponent", array("some-parameter", "other"));
	```

## 共享服務（Shared services）
- `setShared` : 意指可以被註冊成 共享，意味被解析後，此實例將被保存在系統中，每次請求都可以從系統中找回，無需從新註冊或者重新解析

	```
	use Phalcon\Session\Adapter\Files as SessionFiles;
	
	// 把session服務註冊成「shared」類型
	$di->setShared('session', function () {
	    $session = new SessionFiles();
	    $session->start();
	    return $session;
	});
	
	$session = $di->get('session'); // 第一次獲取session服務時，session服務將實例化
	$session = $di->getSession();   // 第二次獲取時，不再實例化，直接返回第一次實例化的對象
	```
- 如果服務註冊時，並非註冊成 shared 時，又想從 Di 中獲取 shared 的 instance，可使用 `getShared`
	- 意指，若以註冊成 shared 類型時，則使用 get 即可

## Manipulating services individually
這邊的 `resolve()` 方法不知從哪邊定義，找了 di 沒發現到
目前正在請教 gitter 的群組	

## 將 未註冊的服務 從 Di 中取出

- 當服務尚未被註冊時（Di 找不到相同名稱的服務），則可以在當下設定該服務

```
$di->set('IndexController', function () {
    $component = new Component();
    return $component;
}, true);
```

- 通過此方法，可以隨意註冊一個沒有被定義過的服務，甚至有同樣的服務內容，卻用不同的服務名稱
	- A 有 abc 服務
	- B 有 abc 服務
	- 但 A 與 B 裝的資訊內容可能不同，如 db config

## 在類別或組件 自動注入 Di
- 當類別或組件，本身需要用到 Di 的服務時，可直接在該類別或者組件中，導入 Di 的服務，不用在外部引入該類別或組件

## 利用 Di 來避免服務重複的解析
- 某些服務應用於每次的 request，如此可能會產生重複的解析，故放入 Di 前，先解析一次後，再放入 Di 中，可稍微提升效能
	- ex : `$router = new MyRouter();`
- 通過 Di 的服務設定，就不用重新再 new 一次（把已解析的對象設置到註冊服務中）
	- ex : `$di->set('router', $router);`
	- ex : `$di->get('router');`
- Q:不確定這種方式跟 `shared` 差別倒底在哪

## 使用文件方式定義服務(Organizing services in files)

- 透過獨立的文件，設定服務內容

```
$di->set('router', function () {
    return include "../app/config/routes.php";
});
```

- 在 routes.php 中

```
$router = new MyRouter();
$router->post('/login');
return $router;
```

- 使用此方式，可以簡化需設定的服務內容

## 使用靜態方法存取 Di（Accessing the DI in a static way）

```
use Phalcon\Di;
$session = Di::getDefault()->getSession();
```

## Factory Default DI

- 這是一開始所提到的 FactoryDefault
- 這個服務器擴展了 `Phalcon\Di `，會自動註冊相應的服務
- the developer does not need to register each service individually.

## 預設的服務名稱

- [預設名稱](https://docs.phalconphp.com/zh/latest/reference/di.html#service-name-conventions)

## 自定義自己的 Di

- Phalcon\DiInterface 必須被實現