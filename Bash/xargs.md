# xargs

可在執行指令行的結果，增加一些指令的參數功能
讓輸出更加的豐富

如 mqtt_sub

| xargs -L1 sh -c 'date "+%D %T $0"' 