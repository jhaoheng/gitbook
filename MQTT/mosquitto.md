# sub 顯示帶日期

`mosquitto_sub -h {host} -t "" -u {username} -P {password} -v | xargs -L1 sh -c 'date "+%D %T $0 $*"'`