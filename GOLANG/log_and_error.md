# log & error

## doc

package errors // import "errors"

Package errors implements functions to manipulate errors.

func New(text string) error


## example
```
package main

import (
	"errors"
	"fmt"
)

func isEnable(enable bool) (bool, error) {
	if enable {
		return false, errors.New("You can't enable this setting")
	}

	return true, nil
}

func main() {
	if _, err := isEnable(true); err != nil {
		fmt.Println(err.Error())
	}
}
```
