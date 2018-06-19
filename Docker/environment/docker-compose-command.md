```
version: "3.0"
services:
  test:
    image: ubuntu:16.04
    tty: true
    environment:
      - RACK_ENV=development
      - passvalue=${value}
    command: /bin/bash -c "echo $$RACK_ENV"
```

# 環境變數

- 環境變數有分
	- 從原本的機器中的變數，帶給新增的機器 : `${變數名稱}`
	- 直接在 compose 中，給予新的變數 : 依循 compose 的設計即可
	- 在 compose command 直接使用 container 的新變數 : 使用 `$$變數名稱` 在 command 中直接使用
	- 使用 .env
