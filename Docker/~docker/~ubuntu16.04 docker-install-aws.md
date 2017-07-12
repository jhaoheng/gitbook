# env
- ubuntu 16.04
- aws

# docker install
- https://docs.docker.com/engine/installation/linux/ubuntu/#uninstall-old-versions
	1. sudo apt-get update
	2. sudo apt-get install \
	    apt-transport-https \
	    ca-certificates \
	    curl \
	    software-properties-common
	3. curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	4. sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	   $(lsb_release -cs) \
	   stable"
	5. sudo apt-get update
	6. sudo apt-get install docker-ce

# docker-compose install
- https://docs.docker.com/compose/install/
1. sudo -i
2. curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
3. sudo chmod +x /usr/local/bin/docker-compose
4. docker-compose --version



# git private
1. ssh-keygen -t rsa -b 4096 -C "email"
2. cat ~/.ssh/id_rsa.pub
3. copy it to github deploy keys