# 更新 osx ruby
\curl -sSL https://get.rvm.io | bash -s stable
rvm list known
rvm install ruby-2.4
rvm use ruby-2.4 --default
ruby -v