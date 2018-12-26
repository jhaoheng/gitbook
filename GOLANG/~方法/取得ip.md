https://blog.csdn.net/wangshubo1989/article/details/78066344



## 取得內網 ip

```
package main

import (
	"net"
	"os"
)

func getInternalIP() {
	addrs, err := net.InterfaceAddrs()
	if err != nil {
		os.Stderr.WriteString("Oops: " + err.Error() + "\n")
		os.Exit(1)
	}

	for _, a := range addrs {
		if ipnet, ok := a.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
			if ipnet.IP.To4() != nil {
				os.Stdout.WriteString(ipnet.IP.String() + "\n")
			}
		}
	}
}
```

## 從特定網站取得公網 ip
> `curl http://ipinfo.io/ip`

```
import (
	"io/ioutil"
	"fmt"
	"net/http"
)

func get_external() {
	resp, err := http.Get("http://ipinfo.io/ip")
	if err != nil {
		return
	}
	defer resp.Body.Close()
	content, _ := ioutil.ReadAll(resp.Body)
	//buf := new(bytes.Buffer)
	//buf.ReadFrom(resp.Body)
	//s := buf.String()
	fmt.Println("ip is => ", string(content))
}
```

## 通過 dns 服務器 8.8.8.8:80 獲取使用的 private ip
```
import (
	"fmt"
	"net"
	"strings"
)

func getPulicIP() {
	conn, _ := net.Dial("udp", "8.8.8.8:80")
	defer conn.Close()
	localAddr := conn.LocalAddr().String()
	idx := strings.LastIndex(localAddr, ":")
	fmt.Println("ip is =>", localAddr[0:idx])
}
```

## 判斷是否是公網 ip
```
func IsPublicIP(IP net.IP) bool {
    if IP.IsLoopback() || IP.IsLinkLocalMulticast() || IP.IsLinkLocalUnicast() {
        return false
    }
    if ip4 := IP.To4(); ip4 != nil {
        switch true {
        case ip4[0] == 10:
            return false
        case ip4[0] == 172 && ip4[1] >= 16 && ip4[1] <= 31:
            return false
        case ip4[0] == 192 && ip4[1] == 168:
            return false
        default:
            return true
        }
    }
    return false
}
```
