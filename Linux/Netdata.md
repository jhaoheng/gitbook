http://www.tecmint.com/netdata-real-time-linux-performance-network-monitoring-tool/



# install

- On Debian / Ubuntu : `apt-get install zlib1g-dev gcc make git autoconf autogen automake pkg-config`
- On Centos / Redhat / Fedora : `yum install zlib-devel gcc make git autoconf autogen automake pkgconfig`

# clone & build

```
# git clone https://github.com/firehol/netdata.git --depth=1
# cd netdata
# ./netdata-installer.sh
```
Note: The `netdata-installer.sh` script will build netdata and install it on your Linux system.
Once the netdata installer finishes, the file `/etc/netdata/netdata.conf` will be created in your system.

# start & stop

```
# /usr/sbin/netdata
```

```
killall netdata
```

Note: Netdata saves on exit its round robbin database information under /var/cache/netdata file, so that when you start again netdata, it will continue from where it was stopped last time.


# Starting and Testing netdata

Now open your browser and navigate to the following address to access the web site for all graphs:
`# http://127.0.0.1:19999/`

# running configuration of netdata at any time
http://127.0.0.1:19999/netdata.conf

# Updating netdata

```
# cd /path/to/netdata.git
# git pull
# ./netdata-installer.sh
```