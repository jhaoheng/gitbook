# install

brew update
brew upgrade
brew cleanup
brew inatll node

發生沒有安裝完成 (npm 無法安裝)
是因為權限無法寫入
依照說明使用 brew postinstall node 後，可以看到權限路徑 node_modules 權限不足
開啟權限即可 chown -R $(whoami) /usr/local

# uninstall

brew uninstall node
brew prune
sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}