# install virtualenvwrapper

- version : 4.7.2
- `pip install virtualenvwrapper`

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