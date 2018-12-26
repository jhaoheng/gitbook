# install virtualenvwrapper

- version : 4.7.2
- 安裝
	- `pip install virtualenvwrapper`
	- `export WORKON_HOME=~/Envs`
	- `mkdir -p $WORKON_HOME`
	- `source /usr/local/bin/virtualenvwrapper.sh` : 安裝相關指令
- 記得將上述指令寫入 bash_profile
- 完成，使用指令與方法，可參考 virtualenvwrapper-use.md

## troubleshooting_1

安裝失敗

> ValueError: unknown locale: UTF-8 
> error in setup command: Error parsing /private/var/folders/20/........../virtualenvwrapper/setup.cfg: ValueError: unknown locale: UTF-8
> 
> Command "python setup.py egg_info" failed with error code 1 in private/...../virtualenvwrapper

在 `~/.bash_profile` 中，寫入

```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

## troubleshooting_2

無法執行 mkvirtualenv
在 bash_profile 中，寫入 `source /usr/local/bin/virtualenvwrapper.sh`