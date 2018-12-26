> use https://golang.org/pkg/regexp/#Regexp.ReplaceAllString


input = "input\n" 故 print 時，會自動換行 

```
import "regexp"
re = regexp.MustCompile(`\r?\n`)
input = re.ReplaceAllString(input, " ")
```