# readme

- env : osx 10.11
- 使用 github 時，根據兩個不同的帳號進行切換 ssh-key

# 產生 ssh-key

`$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

# .ssh/config

> 所有的參數列表 <https://linux.die.net/man/5/ssh_config>，**see PATTERNS**

- Host {本機辨識的名稱}
- HostName 主機位置
- User 登入帳號
- IdentityFile 憑證位置
```

## 參數

- Host : 此為此組 ssh 的名稱，讓本機辨識專用，故可任意取名，當 `git clone git@{Host}:{your_group_name}/{project}.git` 則會依照 {Host} 取得相關 key
- HostName : github.com
- User : git
- IdentityFile : 此為 ssh private key 存放位置

# 範例

> 有兩個不同帳號，user\_A & user\_B

1. 產生 key
2. 設定 config
	- user_A
	
		```
		# user_A@gmail.com
		Host gitlab.com-user_A
		HostName github.com
		User git
		IdentityFile ~/.ssh/user_A/id_rsa
		```
	- user_B

		```
		# user_B@gmail.com
		Host gitlab.com-user_B
		HostName github.com
		User git
		IdentityFile ~/.ssh/user_B/id_rsa
		```
3. 使用，將原本的 `git@github.com:jhaoheng/APNS_cer_build.git` ，github 的部分，改為 Host 的參數名稱
	- ex : `git clone git@github.com-user_A:jhaoheng/APNS_cer_build.git`
4. 注意上傳的 name 與 email
	- 使用 `git config --local -l` : 查看目前該 git repo 的基本設定
		- 可用 `git config --local user.name` 與 `git config --local user.email` 設定
