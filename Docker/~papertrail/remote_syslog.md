# 目標
- 透過 remote_syslog 將 app log 送到 papertrail 中
- 官方建議的 docker image : https://github.com/octohost/remote_syslog
	- 說明 : https://help.papertrailapp.com/kb/configuration/configuring-centralized-logging-from-docker/#mount

# 如何使用

- ex : 
	- 建立一個 file.log，並得知路徑位置 $path
	- 取得你的 papertrail 的 destination path, 像是 `logs3.papertrailapp.com:46888`
	- 組合指令 `docker run -d -v=... --name remote_syslog octohost/remote_syslog {remote_syslog 指令串}`
	- finish : `docker run -d -v=$path/file.log:/file.log --name remote_syslog octohost/remote_syslog --hostname $hostname -p 46888 -d logs3.papertrailapp.com /file.log`

## compose
```
  remote_syslog:
    image: octohost/remote_syslog:latest
    container_name: papertrail
    volumes:
      - /home/ubuntu/ejabberd/docker/logs/ejabberd.log:/ejabberd.log
    entrypoint: /usr/local/bin/remote_syslog -D --hostname max -p 46888 -d logs3.papertrailapp.com /ejabberd.log
    tty: true
    restart: always
```

# remote_syslog reference

```
Usage: remote_syslog [OPTION]... <FILE>...

Options:
    -c, --configfile PATH            Path to config (/etc/log_files.yml)
    -d, --dest-host HOSTNAME         Destination syslog hostname or IP (logs.papertrailapp.com)
    -p, --dest-port PORT             Destination syslog port (514)
    -D, --no-detach                  Don't daemonize and detach from the terminal
    -f, --facility FACILITY          Facility (user)
        --hostname HOST              Local hostname to send from
    -P, --pid-dir DIRECTORY          DEPRECATED: Directory to write .pid file in
        --pid-file FILENAME          Location of the PID file (default /var/run/remote_syslog.pid)
        --parse-syslog               Parse file as syslog-formatted file
    -s, --severity SEVERITY          Severity (notice)
        --strip-color                Strip color codes
        --tcp                        Connect via TCP (no TLS)
        --tls                        Connect via TCP with TLS
        --new-file-check-interval INTERVAL
                                     Time between checks for new files

Advanced options:
        --[no-]eventmachine-tail     Enable or disable using eventmachine-tail
        --debug-log FILE             Log internal debug messages
        --debug-level LEVEL          Log internal debug messages at level

Common options:
    -h, --help                       Show this message
        --version                    Show version

Example:
    $ remote_syslog -c configs/logs.yml -p 12345 /var/log/mysqld.log
```