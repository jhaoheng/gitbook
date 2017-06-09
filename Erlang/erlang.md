# 資源
[erlang.org](http://erlang.org)
[Erlang程式設計與問題解決](https://zh.wikibooks.org/zh-tw/Erlang%E7%A8%8B%E5%BC%8F%E8%A8%AD%E8%A8%88%E8%88%87%E5%95%8F%E9%A1%8C%E8%A7%A3%E6%B1%BA)
[erlang 語言入門](http://lolikitty.pixnet.net/blog/post/128629189-erlang-%E8%AA%9E%E8%A8%80%E5%85%A5%E9%96%80%EF%BC%9Ahello-world-!!)

# hello_erlang_1

- hello.erl
	- code
	
		```
		-module(hello).
		-export([print/0]).
		
		print() -> 
		io:format("World!~n").
		```
	- 解析
		- `-module`
		- `-export`
		- `[print/0]` : 函數名稱 print , 參數 0 個
		- `io:format` : 格式化標準輸出函數，參考 [io : Available control sequences:](http://erlang.org/doc/man/io.html#fread-2)
			- `~n` : Writes a new line.

- test
	- 流程
		1. `erl`
		2. `pwd().`
		3. `ls().`
		4. `c(hello).` : hello 為 hello.erl 的檔案名稱, c() 為編譯此檔案 -> 會產生 hello.beam 的執行擋
		5. `hello:print().`
	- 基本
		- `.` : 每一句皆以此，作為一個斷句

# hello_erlang_2

- hello2.erl

	```
	-module(hello2).

	-compile(export_all).
	
	square(N) -> N*N.
	
	sum([]) -> 0;
	sum([Num|Ns]) -> Num + sum(Ns).
	
	sum_square([]) -> 0;
	sum_square([Num|Ns]) -> square(Num) + sum_square(Ns).
	```
- test
	- `hello2:square(2).` : 4
	- `hello2:sum([1,2,3,4,5]).` : 15
	- `;` : 代表 or
	- `,` : 代表 and

# hello_erlang_3

- hello3.erl

	```
	solve(1) -> [1];
	solve(N) when N rem 2 == 0 -> [N|solve(N div 2)];
	solve(N) -> [N|solve(N*3+1)].
	
	set(N) 	-> {ok, [H|T] = solve(N)}.
	```

# hello_erlang_4 : regular expressions

- hello4.erl

	```
	-module(do).
	
	-compile(export_all).
	
	multire([],_) ->
	    nomatch;
	multire([RE|RegExps],String) ->
	    case re:run(String,RE,[{capture,none}]) of
	    match ->
	        RE;
	    nomatch ->
	        multire(RegExps,String)
	    end.
	
	% 開頭為 Hello, 結尾有 world, 均符合
	test(Foo) ->
	    test2(multire(["^Hello","world$","^....$"],Foo),Foo).
	
	test2("^Hello",Foo) ->
	    io:format("~p matched the hello pattern~n",[Foo]);
	test2("world$",Foo) ->
	    io:format("~p matched the world pattern~n",[Foo]);
	test2("^....$",Foo) ->
	    io:format("~p matched the four chars pattern~n",[Foo]);
	test2(nomatch,Foo) ->
	    io:format("~p failed to match~n",[Foo]).
	
	
	-define (Email_pattern, "\\b[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*\\b").
	-define (Mac_address_pattern, "^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$").
	
	checkPattern(Foo) -> 
		checkPattern2(multire([[?Email_pattern], [?Mac_address_pattern]],Foo),Foo).
	
	checkPattern2([?Email_pattern], Foo) ->
		io:format("email format : ~p ~n", [Foo]);
	checkPattern2([?Mac_address_pattern], Foo) ->
		io:format("device format : ~p ~n", [Foo]);
	checkPattern2(nomatch, Foo) ->
		io:format("nomatch : ~p ~n", [Foo]). 	
	```

# 基本

- `erl`

- class_1
	1. `Arg_1 = 'hello world'.` : 以大寫開頭的連續文字是變數。若以底線 ( _ ) 開頭的連續文字，則是匿名變數。變數提供單次賦值。一個已經賦值的變數，再賦值會失敗。
	2. `io:format("~w~n", [Arg_1]).`

- class_2-1 : 列表
	1. `Var_1 = [hello, 'World', 101].` : 
	2. `io:format("~w~n", [Var_1]).`
- class_2-2 : 列表
	1. `Var_2 = [max | Var_1].`
	2. `io:format("~w~n", [Var_2]).`
- class_3 : 邏輯
	1. `AAA = [11,22,33,44].`
	2. `BBB = [1, AAA].`
	3. `CCC = [1 | AAA].`
- class_4 : 單引號與雙引號
	1. `'Hello'` : 單引號為 原子 的表示
	2. `"Hello"` : 雙引號為 字串 的表示
- class_5 : 定義一個常量
	- `-define(Var, "content")`
- class_6 : 從列表中，取出參數
	1. `Topic = "/zavio/ipcam/alert/sid001/a/b/c/d/e".`
	2. `Keys = string:tokens(Topic, "/").`
	3. `[Company, Dtype, Etype, Sid | Others] = Keys.`
	4. `io:format(" Company = ~p~n DeviceType = ~p~n Event_type = ~p~n Sid = ~p~n Others = ~p~n", [Company, Dtype, Etype, Sid, Others]).`

## and, or, true, false, when

- 每個敘述句中，`,` 代表 and，`;` 代表 or
- Erlang 透過用 `true` 與 `false` 判斷真偽
- when : guard expression, ex : `when N rem 2 == 0 -> true.`

## 運算子

- 二元運算子： not, and, or, xor, andalso, orelse 。
- 比較運算子： ==, /=, >, <, >=, =< , =:=
- rem : 餘數運算子
- div : 商數運算子

## if, else, end.

```
if
  % do something and get the value
  X >= Val -> Something;
  % for doing something otherwise and get the value
  true -> Else_than_the_Something 
end.
```

## case, end.

```
fall_velocity(P, D) when D >= 0 ->
case P of
x -> {ok,math:sqrt(2 * 9.8 * D)};
y -> {ok,math:sqrt(2 * 1.6 * D)};
z -> {ok,math:sqrt(2 * 3.71 * D)};
Otherwise-> io:format("no match:~p~n",[Otherwise]),
            {error, "coordinate is not x y or z"}
end.
```

## try, catch, after, end.



# q

1. 陣列表示
2. 如何刪除變數？或重新變數附值

