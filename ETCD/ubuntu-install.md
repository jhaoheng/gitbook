1. chekc version : https://github.com/coreos/etcd/releases, 複製 linux-amd64.tar.gz 的連結
2. 放入參數 : ETCD_PKG=..{link}..
3. 執行以下

``` ubuntu:16.04
curl -L $ETCD_PKG -o etcd.tar.gz
tar xzvf etcd.tar.gz
rm etcd.tar.gz
cp etcd*/etcd /usr/local/bin/
cp etcd*/etcdctl /usr/local/bin/
rm -rf etcd*
```

4. 測試 `etcd --version`