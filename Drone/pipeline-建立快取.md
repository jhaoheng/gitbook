# 建立快取

```
pipeline:
	restore_cache:
		image: appleboy/drone-sftp-cache
		server: example.com
		port: 22
		username: ...
		password: ...
		path: /var/cache/drone
		restore: true
		mount:
			- node_modules
	build:
		image: node:latest
		commands:
			- npm install
	rebuild_cache:
		image: appleboy/drone-sftp-cache
		server: example.com
		port: 22
		username: ...
		password: ...
		path: /var/cache/drone
		rebuild: true
		mount:
			- node_modules
```