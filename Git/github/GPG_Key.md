# GPG

## 什麼是 GPG

<https://www.gnupg.org/index.html>

- 可產生不同的 key，並針對這些 key 進行管理
- 當產生後，會依據設定的『用戶名稱』、『你設定的 mail』產生 GPG key
	- 主要產生 `public_GPG_key`、`subordinate private keys`
	- 而過程中會要求是否設定 passphrase，是用來保護 `subordinate private keys`
	
	
	```
	pub   rsa4096/<public_GPG_key> 2016-04-09 [SC]
	uid         [ultimate<設定的存活時間>] maxhu<設定名稱> (fot github<設定備註>) xxxx@gmail.com<設定email>
	sub   rsa4096/<subordinate private keys> 2016-04-09 [E]
	```
	
## 開源，為什麼要用 GPG

<https://github.com/blog/2144-gpg-signature-verification>

開源開發，開發者來自世界各地，有時驗證該 commit 或 tag 來自被驗證過的來源是很重要的事
若 commit 或 tag 後，就會在 repo commits 中，出現 **Verified** 字樣，代表此來源，有被驗證過

>When you view a signed commit or tag, you will see a badge indicating if the signature could be verified using any of the contributor's GPG keys uploaded to GitHub. You can upload your GPG keys by visiting the [keys settings page](https://github.com/settings/keys).

**NOTICE** : GitHub Desktop does not support GPG signing.

# 安裝 GPG
> homebrew 上的 gpg (GnuPG) 2.0.30 在 gpg-agent 上有問題，不建議安裝

- 安裝環境
	- mac OSX EI Capitan 10.11.4
- https://sourceforge.net/p/gpgosx/docu/Download/
	- GnuPG-2.1.11-002.dmg
	- (SHA-1: 558e20f8d938f2d870aae3bab59ce98649625c01) **安裝檔中有說明，如何『驗證』與如何『移轉已存在的 gpg key』** 
- 安裝路徑 `/usr/local/gnupg-2.1/`

> 因 github 預設使用 gpg，安裝後指令為 gpg2，故
> `ln -s /usr/local/gnupg-2.1/bin/gpg2 /usr/local/bin/gpg`

## 移除 GPG

```
rm '/usr/local/bin/gpg*'
cd /usr/local
sudo rm -rf gnupg-2.1/
rm -rf ~/.gnupg
```

## 產生 GPG key

- 執行 `gpg --full-gen-key` ，依序選擇
	- (1) RSA and RSA (default)
	- What keysize do you want? (2048) 4096
	- 0 = key does not expire
	- 輸入 name
	- 輸入指定的 email **此為設定 github 的 email**
- 而 key 的存放位置為 `/Users/<user>/.gnupg` 下
- 查看 key `gpg --list-keys`

## 將 GPG key 放入 github

- `gpg --list-keys` : 找出要使用的 gpg key id : A8F99211
	
	```
	/Users/hubot/.gnupg/pubring.gpg
	------------------------------------
	pub   4096R/A8F99211 2016-04-05
	uid                  Hubot 
	sub   4096R/Z832QR89 2016-04-05
	```
- 輸出 : `gpg2 --armor --export <gpg key ID>`
- 複製，貼到 [github gpg keys](https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/) 中即可

## 設定本機端 git 的 GPG key
**[Telling Git about your GPG key](https://help.github.com/articles/telling-git-about-your-gpg-key/)**

在設定好上述動作後，接下來需要讓 git 知道你要使用哪個 GPG key。

- 可以針對某個 .git 使用某個特別的 key
- 也可以透過 global 的方式建立通用 key
- 基本上在 git config 下，要有這兩個參數

	```
	user.signingkey=<your public key>
	commit.gpgsign=true
	```

- `git config`
	- `--global user.signingkey <public GPG key>`
	- `--local  user.signingkey <public GPG key>`
- `git config`
	- `--global commit.gpgsign true`
	- `--local  commit.gpgsign true`


## Commit With GPG key
> Note: GitHub Desktop does not support GPG signing.

```
git commit -m "your commit message"
# 第一次使用時，會要求輸入在建立 GPG key 時輸入的 **passphrase**
# 往後無需使用
```

### 查看 push 後的 verified
1. `git push` 後，登入 github 的該 repo
2. 點選 Commits
3. 可以看到 **verified signature,**


## tags using GPG
> Note: GitHub Desktop does not support GPG signing.

1. `git tag -s [tag-name]`
2. 驗證 `git tag -v [tag-name]`


## 測試心得

- 只有第一次使用該 gpg 憑證時，會要求輸入 passphrase
- 透過 global 與 local 的設定，可分別針對不同的 git 進行是否使用該憑證的要求
- 但 gpg 上傳到 github 上，應該只是讓 commit 上多一個 **此 commit 經過驗證**，似乎無法阻止非 **無通過驗證的用戶 commit**