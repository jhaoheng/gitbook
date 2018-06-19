# 打包到 docker registry

```
publish_latest:
	image: docker.io/jhaoheng/{your_image_name}
	pull: true
	repo: ${DRONE_REPO}
	tags: [ 'latest' ]
	secrets: [docker_username, docker_password]
	when:
		event: [ push ]
		branch: [ master ]
		local: false
```