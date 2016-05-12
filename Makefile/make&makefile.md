# make 命令和 makefile

`make - GNU make utility to maintain groups of programs`

- make 是一種指令 
- makefile 是被 make 執行的檔案

## 何謂 makefile ?
1. make 命令雖然有很多內建的功能，但它也無法知道如何建立應用程式。故必須提供一個檔案，即 makefile，告訴 make 如何建立應用程式。
2. makefile 與專案的原始碼檔案，通常放在同一個目錄中。
3. 可以同時有很多不同的 makefile 管理專案的不同部分。
4. make 命令和 makefile 的結合，不僅控制原始碼的編譯，也可以用來準備使用手冊文件、安裝應用程式到目的目錄中。

## 使用 makefile 的用途
1. 簡化編譯時所需要下達的指令；
2. 若在編譯完成之後，修改了某個原始碼檔案，則 make 僅會針對被修改了的檔案進行編譯，其他的 object file 不會被更動；
3. 最後可以依照相依性來更新( update )執行檔。

## make 與 configure
1. 當執行 make 時，make 會在當時的目錄下搜尋文字檔 makefile ( or Makefile )，其記錄了原始碼如何編譯的詳細資訊。
2. 偵測程式 configure
	- 軟體開發者會寫一支偵測程式來偵測使用者的作業環境，以及該作業環境是否有軟體開發商所需要的其他功能；
	- 偵測完畢後，會主動的建立 Makefile 的規則檔案。
	- 偵測程式的檔名為 configure 或者是 config。

## makefile 的結構
- ex0: 基本結構

	```
	target：dependency
		command
	```
	
	- target（目標）:一個目標檔，可以是Object檔，也可以是執行檔。還可以是一個標籤（Label）。
	- dependency（依賴）:要產生目標檔（target）所依賴哪些檔。ex : 標頭檔 .c .h
	- command（命令）：建立專案時需要執行的shell命令（注：命令（command）部分的每行的縮進必須要使用Tab鍵而不能使用多個空格）。
	
- ex1:

	```
	target: file1.c file2.h 
		gcc -o 欲建立的執行檔 file1.c
	```
- ex2:

	```
	init:
		pwd
	test:
		echo "hello"
	```	
	
	- 執行 `make init` or `make test`

- ex3:

	```
	test.o: test.c test.h
		gcc –c test.c
	```

### 規則
1. 所有的法則必須在同一行，而且行首必須為 <tab>；不能為空白
2. 在 makefile 中，行尾如果有一個空白，會造成 make 命令執行錯誤。
3. 註解為 `#`

### Makefile的基本內容
- 顯式規則 : 顯式規則說明如何產生一個或多個的目標檔。這是由 Makefile的 書寫者明顯指出，要產生的檔，檔的依賴檔，產生的命令。
- 變數定義 : 在 Makefile 中可以定義一系列的變數，變數一般都是字串，當 Makefile 被執行時，變數的值會被擴充到相對應的引用位置上。
- 隱含規則 : 由於 GNU make 具有自動推導功能，所以隱含規則可以比較粗糙地簡略地書寫 Makefile，然後由 GNU make 的自動推導功能完成隱含規則的內容。
	
	```
	foo.o: common.h
    gcc -c foo.c
    # 由於產生 foo.o 的指令就是 gcc -c foo.c，因此在 Makefile 裡可以將其簡化為
    foo.o: common.h
	```
- 檔指示 : 其包括了三個部分，一個是在一個 Makefile 中引用另一個 Makefile，就像 C 語言中的 include 一樣；另一個是指根據某些情況指定 Makefile 中的有效部分，就像 C 語言中的預編譯 #if 一樣；還有就是定義一個多行的命令。
- 注釋 : Makefile 中只有行注釋，和 UNIX 的 Shell 腳本一樣，其注釋是用 “#” 字元，如果你要在你的Makefile中使用 “#” 字元，可以用反斜框進行轉義，如：“\#”。

### Makefile中的變數
- Makefile 中定義的變數，與 C/C++ 語言中的巨集一樣，代表一個文本字串，在Makefile 被執行時候變數會自動地展開在所使用的地方。Makefile中的變數可以使用在“目標”，“依賴目標”，“命令”或 Makefile 的其他部分中。
- Makefile 中變數的命名字可以包含字元、數位，下劃線（可以是數位開頭），但不應該含有 “:”、“#”、“=” 或是空字元（空格、Enter等）。
- Makefile 中變數是大小寫敏感的，“foo”、“Foo”和“FOO”是三個不同的變數名。傳統的 Makefile 的變數名是全大寫的命名方式
- 變數在聲明時需要給予初值，而在使用時，需要在變數名前加上 "$" 符號

	```
	# 宣告變數
	MACRO = value
	```
	```
	# 使用變數
	targets = foo
	$(targets): common.h
    gcc -o $(targets) foo.c
    ```
- `:=` 與 `=` 與 `?=` 與 `+=`

	```
	x = foo
	y = $(x) bar
	x = xyz
	# y 的值為 xyz bar
	``` 
	```
	x := foo
	y := $(x) bar
	x := xyz
	# y 的值為 foo bar
	```   
	```
	FOO ?= bar
	# 若 FOO 未定義，則 FOO = bar；若 FOO 已定義，則 FOO 的值維持不變。
	```
	```
	CFLAGS = -Wall -g
	CFLAGS += -O2
	# CFLAGS 的值就變成 -Wall -g -O2
	```
- define 語法
	
	```
	define foo
	uname -a
	echo $$SHELL
	endef
	all:
		$(foo)
	# 上例可以視同於
	foo = uname -a; echo $$SHELL #注意到使用了 $$，讓 '$' 能傳到 Shell 中。
	all:
        $(foo)
	```	

- 在 target 裡另外指定變數的值
	
	```
	foo = abc
	all: foo = xyz
	all:
        echo $(foo) # 此時，foo 的值為 xyz
    # 以上等同於    
    all: override foo = xyz
    # 或
	all: export foo = xyz
	```
- 指定 make 存取環境變數
	
	```
	all:
	    @echo $(CFLAGS)
	# 雖然在 Makefile 裡雖然沒有指定 CFLAGS 的值，但 make 會試圖以環境變數來代出 CFLAGS 的值
	# 可搭配 wildcard 指令在變數裡展開 * ? [...] 等萬用字元
	objects=$(wildcard *.o)
	```
	
- `$?` : 代表已被更新的 dependencies 的值。也就是 dependencies 中，比 targets 還新的值。
- `$@` : 代表 targets 的值。
- `$<` : 代表第一個 dependencies 的值。
- `$*` : 代表 targets 所指定的檔案，但不包含副檔名。
	
	```
	print: foo1.c foo2.c foo3.c
	    lpr -p $?
	    touch print
    # 這樣會將 foo1.c foo2.c foo3.c 中已有更新的內容印至印表機。
	```

### shell 的提示 : 每條 Command 會啟動一個新的 Shell
- `;` : 透過 `;` 的符號，來進行指令的連續執行
	
	```
	all:
	    if [ -f foo ]; then rm foo; fi
	```
- `&&` : 透過 `&&` 依據上一個指令是否成功，若成功，則執行下一行指令

	```
	all:
	    cd subdir && git init
	```	
- `@` : 不要顯示執行的指令
- `-` : 表示即使該行指令出錯，也不會中斷執行。

	```
	.PHONY: clean
	clean:
	    @echo "Clean..."
	    -rm *.o
	# 因為 make 會一行一行將正在執行的 Commands 顯示在螢幕上，但您可以利用 @ 來暫時關閉這個功能。
	# 而 make 只要遇到任何錯誤就會中斷執行。但像是在進行 clean 時，也許根本沒有任何檔案可以 clean，因而 rm 會傳回錯誤值，因而導致 make 中斷執行。我們可以利用 - 來關閉錯誤中斷功能，讓 make 不會因而中斷。
	```
### 條件判斷

- ifeq

	```
	# 檢查 value1, value2 是否相等
	ifeq (value1, value2)
	    ...
	else
	    ...
	endif
	```
	
- ifneq : 提供和 ifeq 相反的功能	

- ifdef

	```
	# 檢查 variable 變數是否為空的
	ifdef variable
	    ...
	else
	    ...
	endif
	```
- ifndef : 提供和 ifdef 相反的功能

### 引入檔案
`include foo.in` : 將 foo.in 的內容全數引入 Makefile 裡

`include foo.in common*.in $(MAKEINCS)` : 同時引入多個檔案、使用變數 `$(MACRO)` 或是使用萬用字元（* ? 或 [...]）

### 子目錄

- 如果該專案有多個目錄，且每一個目錄中都有 Makefile，則利用以下指令來進入子目錄並進行編譯 : `cd dir && $(MAKE)`

	```
	SUBDIRS = dir1 dir2 dir3
	all:
	        for i in $(SUBDIRS); do 
	                (cd $$i && make); 
	        done
	clean:
	        for i in $(SUBDIRS); do 
	                (cd $$i && make clean); 
	        done
	install:
	        for i in $(SUBDIRS); do 
	                (cd $$i && make install); 
	        done
	```

### 命令的變數
- AR 函式庫打包程式。預設命令是“ar”。
- AS 組合語言編譯程序。預設命令是“as”。
- CC C語言編譯程序。預設命令是“cc”。
- CXX C++語言編譯程序。預設命令是“g++”。
- CO 從 RCS檔中擴充檔程式。預設命令是“co”。
- CPP C程式的預處理器（輸出是標準輸出設備）。預設命令是“$(CC) –E”。
- FC Fortran 和 Ratfor 的編譯器和預處理程式。預設命令是“f77”。
- GET 從SCCS檔中擴充檔的程式。預設命令是“get”。
- LEX Lex方法分析器程式（針對於C或Ratfor）。預設命令是“lex”。
- PC Pascal語言編譯程序。預設命令是“pc”。
- YACC Yacc文法分析器（針對於C程式）。預設命令是“yacc”。
- YACCR Yacc文法分析器（針對於Ratfor程式）。預設命令是“yacc –r”。
- MAKEINFO 轉換Texinfo原始檔案（.texi）到Info檔程式。預設命令是“makeinfo”。
- TEX 從TeX原始檔案建立TeX DVI檔的程式。預設命令是“tex”。
- TEXI2DVI 從Texinfo原始檔案建立軍TeX DVI 檔的程式。預設命令是“texi2dvi”。
- WEAVE 轉換Web到TeX的程式。預設命令是“weave”。
- CWEAVE 轉換C Web 到 TeX的程式。預設命令是“cweave”。
- TANGLE 轉換Web到Pascal語言的程式。預設命令是“tangle”。
- CTANGLE 轉換C Web 到 C。預設命令是“ctangle”。
- RM 刪除檔命令。預設命令是“rm –f”。

### 命令參數變數
- ARFLAGS 函式庫打包程式AR命令的參數。預設值是“rv”
- ASFLAGS 組合語言編譯器參數。（當明顯地調用“.s”或“.S”檔案時）。
- CFLAGS C語言編譯器參數。
- CXXFLAGS C++語言編譯器參數。
- COFLAGS RCS命令參數。
- CPPFLAGS C預處理器參數。（ C 和 Fortran 編譯器也會用到）。
- FFLAGS Fortran語言編譯器參數。
- GFLAGS SCCS “get”程式參數。
- LDFLAGS 鏈結器參數。（如：“ld”）
- LFLAGS Lex文法分析器參數。
- PFLAGS Pascal語言編譯器參數。
- RFLAGS Ratfor 程式的Fortran 編譯器參數。
- YFLAGS Yacc文法分析器參數。


## make 語法

`make [ -f makefile ] [ options ] ... [ targets ] ...`

- -j N：讓 make 在同一個時間執行 N 個命令，以加速編譯的時間。
- -k：讓 make 在遇到錯誤時，仍然繼續運行，不停止在第一個問題點。
- -n：告訴 make 只印出將會進行的工作，而不真正去編譯。
- -f <filename>：告訴 make 該使用的 makefile 檔案。如果不使用這個選項， make 會依序尋找目錄中的 GNUmakefile, makefile, Makefile。
- 直接於 make 時，指定目標項目名稱 : `make targetfile`

### make 參數
- 可以用 make 的參數來蓋過 Makefile 裡，用變數所指定的參數。`make CFLAGS="-g -O2"`
- 可以在 Makefile 裡使用 override 來避免變數的值被 make 的參數所取代。`override CFLAGS = -Wall -g`
- 可以在 make 後指定要重新建立的 target。`make clean` 會執行 Makefile 中的 clean 區段。

