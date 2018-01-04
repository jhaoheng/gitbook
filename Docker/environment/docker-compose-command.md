```
version: "3.0"
services:
  test:
    image: ubuntu:16.04
    tty: true
    environment:
      - RACK_ENV=development
    command: /bin/bash -c "echo $${RACK_ENV}"
```