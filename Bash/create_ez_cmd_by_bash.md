# 基本
1. 建立 cmd.sh
2. chmod +x cmd.sh
3. 確定路徑

# 路徑

看是要放在 .bash_profile 中，或者放在 /usr/local/bin 中

若放在 .bash_profile
export PATH=你的絕對路徑:$PATH
ex : 絕對路徑 = ~/bin/，cmd.sh 放在此路徑下

若是放在 /usr/local/bin 中
ln -s "絕對路徑/cmd.sh" /usr/local/bin/你的指令名稱