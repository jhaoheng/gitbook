# 路由 (Routing)

- 路由器用來定義收到 request 時，要指到哪些控制器或者處理程序
- 有兩種模式
	- MVC 模式
	- 匹配模式
- 透過 `Phalcon\Mvc\Router` 使用，implements :
	- `Phalcon\Di\InjectionAwareInterface`
	- `Phalcon\Mvc\RouterInterface`
	- `Phalcon\Events\EventsAwareInterface`
- 在 [phalcon document tutorial-invo#路由](https://docs.phalconphp.com/zh/latest/reference/tutorial-invo.html#routing) 中，有提到，若使用 MVC 架構，預設的路由為 `/:controller/:action/:params`
	- 在 index.php 實踐，引用 MVC
	
		```
		$application = new \Phalcon\Mvc\Application($di);
		echo $application->handle()->getContent();
		```
- 範例，可參考 `github/phalcon/mvc/multiple`	中，有客製化路由，前後台的方法

## 使用

```
use Phalcon\Mvc\Router;
$router->add(
	...
);
$router->handle();
```