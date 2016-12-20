# for Node.js v4
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

# OR for Node.js v5
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

# OR for Node.js v6
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# install
sudo apt-get install -y nodejs

# delete
sudo apt-get purge nodejs npm





# 使用 npm 進行更新
sudo npm cache clean -f
sudo npm install -g n
sudo n stable