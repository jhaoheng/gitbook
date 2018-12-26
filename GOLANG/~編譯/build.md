# build raspberry

## 設定資訊參考
> GoArm : https://github.com/golang/go/wiki/GoArm

## 找到 arm=?
> https://www.maketecheasier.com/finding-raspberry-pi-system-information/

- `cat /proc/cpuinfo` : 透過此方法找到設定檔應該為何

## 編譯方法
> https://www.thepolyglotdeveloper.com/2017/04/cross-compiling-golang-applications-raspberry-pi/

`env GOOS=linux GOARCH=arm GOARM=? go build -o <target_executable> <source_file>`

# build OSX

```
SET CGO_ENABLED=0
SET GOOS=darwin
SET GOARCH=amd64
go build main.go
```
`env GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -o <target_executable> <source_file>`
