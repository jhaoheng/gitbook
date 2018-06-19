## pipeline condition branches
```
pipeline:
	build:
		image: golang
		commands:
			- go build
			- go test
branches: 
	include: [master, develop]
	exclude: [...]
```