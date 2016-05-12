synology/docker/redmine 位置
關於安裝後的位置


透過docker app查看位置
永遠都是home/redmine/data….
但在finder裡面找不到，透過ssh進去也找不到，寫信去問也一樣。
不如就乾脆自己動手搜尋一下
可以發現，存放的位置在@docker裡面的




./volume1/@tmp/@pplepriv@te/redmine
./volume1/@database/mysql/redmine
./volume1/docker/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/home/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/home/redmine/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/home/redmine/redmine/lib/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/home/redmine/redmine/test/integration/lib/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/home/redmine/redmine/test/unit/lib/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/var/log/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/var/spool/cron/crontabs/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/etc/nginx/sites-enabled/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/etc/logrotate.d/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/app/setup/config/nginx/redmine
./volume1/@docker/aufs/mnt/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/app/setup/config/redmine
./volume1/@docker/aufs/diff/149f6943babf3e0ae05a34e72865d3e6a364249dd1f26cb1390752db6cc570f7/etc/logrotate.d/redmine
./volume1/@docker/aufs/diff/149f6943babf3e0ae05a34e72865d3e6a364249dd1f26cb1390752db6cc570f7/home/redmine
./volume1/@docker/aufs/diff/149f6943babf3e0ae05a34e72865d3e6a364249dd1f26cb1390752db6cc570f7/home/redmine/redmine
./volume1/@docker/aufs/diff/149f6943babf3e0ae05a34e72865d3e6a364249dd1f26cb1390752db6cc570f7/home/redmine/redmine/lib/redmine
./volume1/@docker/aufs/diff/149f6943babf3e0ae05a34e72865d3e6a364249dd1f26cb1390752db6cc570f7/home/redmine/redmine/test/integration/lib/redmine
./volume1/@docker/aufs/diff/149f6943babf3e0ae05a34e72865d3e6a364249dd1f26cb1390752db6cc570f7/home/redmine/redmine/test/unit/lib/redmine
./volume1/@docker/aufs/diff/149f6943babf3e0ae05a34e72865d3e6a364249dd1f26cb1390752db6cc570f7/var/spool/cron/crontabs/redmine
./volume1/@docker/aufs/diff/f4d1e8b81001eaddb4e746daf9412e7646dec40b74c0f48df1c7463a6a595e6e/app/setup/config/nginx/redmine
./volume1/@docker/aufs/diff/f4d1e8b81001eaddb4e746daf9412e7646dec40b74c0f48df1c7463a6a595e6e/app/setup/config/redmine
./volume1/@docker/aufs/diff/b80a3bcd3fcd5772028b978460b5ea49ea454fd709cb8c06c7498582ecde9deb/app/setup/config/nginx/redmine
./volume1/@docker/aufs/diff/b80a3bcd3fcd5772028b978460b5ea49ea454fd709cb8c06c7498582ecde9deb/app/setup/config/redmine
./volume1/@docker/aufs/diff/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/home/redmine
./volume1/@docker/aufs/diff/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/home/redmine/redmine
./volume1/@docker/aufs/diff/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/var/log/redmine
./volume1/@docker/aufs/diff/e52127489d21fb79146f8f9f927520a22fac7646caff04166eca05b808f02a9b/etc/nginx/sites-enabled/redmine
./volume1/@docker/aufs/diff/e39f6be27f7564ae0093e401af76b3c7973cae3af05d25ad1c886ab7e02b63e9/var/spool/cron/crontabs/redmine
./volume1/@docker/aufs/diff/e39f6be27f7564ae0093e401af76b3c7973cae3af05d25ad1c886ab7e02b63e9/etc/logrotate.d/redmine
./volume1/@docker/aufs/diff/e39f6be27f7564ae0093e401af76b3c7973cae3af05d25ad1c886ab7e02b63e9/home/redmine
./volume1/@docker/aufs/diff/e39f6be27f7564ae0093e401af76b3c7973cae3af05d25ad1c886ab7e02b63e9/home/redmine/redmine
./volume1/@docker/aufs/diff/e39f6be27f7564ae0093e401af76b3c7973cae3af05d25ad1c886ab7e02b63e9/home/redmine/redmine/lib/redmine
./volume1/@docker/aufs/diff/e39f6be27f7564ae0093e401af76b3c7973cae3af05d25ad1c886ab7e02b63e9/home/redmine/redmine/test/integration/lib/redmine
./volume1/@docker/aufs/diff/e39f6be27f7564ae0093e401af76b3c7973cae3af05d25ad1c886ab7e02b63e9/home/redmine/redmine/test/unit/lib/redmine
./volume1/@docker/vfs/dir/85d732eca603ad60f2be48d9e760eae1d0b2ed1bc1421c2e28c06f08d895770a/redmine
./volume1/@docker/vfs/dir/89125cc7b87f7d19af14cd8f0ee754ec0742459ef274c8f28741b0177f6219b8/redmine
./volume1/@docker/vfs/dir/31e66ae95c60bb3573136cf68ba542c4c10f90f86dd48c6485524a3411bcd6c9/redmine


從上面的位置看來，可以分為幾個路徑




./volume1/@docker/aufs/mnt/
./volume1/@docker/aufs/diff/
./volume1/@docker/vfs/dir/




此時輸入




docker ps



CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
e52127489d21 registry.hub.docker.com/sameersbn/redmine:3.0.1 “/app/init app:start About an hour ago Up About an hour 443/tcp, 0.0.0.0:30002->80/tcp synology_redmine




可以發現CONTAINER ID : e52127489d21
這應該就是我要的傢伙….



感覺還挺好玩的….但是…要學的東西好多….



ps:另外進去@docker/containers
這邊就是syno->docker app->容器 的info
所有的資訊都從這邊的json讀寫進來