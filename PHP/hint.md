## 執行 bash
- 透過指令

```
shell_exec($cmd);
```
- 透過特殊符號 \`，等同於 bash_exec

```
`test`
```

## 執行 git pull

- 若要進行 ssh 則必須確認以下事項
	1. ssh key 是否有根據該 server 角色產生對應的 key
	2. server 是否認識該 ssh 位置

- 若透過 https 進行
	- git pull https://<user>:<pw>@gitlab.com/<repo>.git master


## Running a background process in PHP

https://nsaunders.wordpress.com/2007/01/12/running-a-background-process-in-php/