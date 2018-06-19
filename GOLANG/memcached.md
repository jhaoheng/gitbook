https://godoc.org/github.com/bradfitz/gomemcache/memcache

```
package main

import (
	"github.com/bradfitz/gomemcache/memcache"
	"log"
)

func main() {
	con := memcache.New("localhost:11211")
	if con == nil {
		log.Println("Failed to connect Memcache")
	}

	item := &memcache.Item{Key: "jgj", Value: []byte("test_value"), Expiration: 0}
	err := con.Set(item)
	if err != nil {
		log.Println("failed to set item: %s", err)
	}

	item1, err := con.Get("jgj")
	if err != nil {
		log.Println("Failed to get item %s ", err)
		return
	}
	log.Println("get value: %s", item1.Value)
}
```