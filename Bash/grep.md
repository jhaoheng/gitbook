# grep

ps aux | grep {key} 時，不顯示此指令的畫面，請加入 grep -v grep
-> ps aux | grep -v grep | grep {key}