# vegeta
> 須先安裝 vegeta : https://github.com/tsenart/vegeta

1. `echo "GET http://127.0.0.1:3000/test" |vegeta attack -duration=10s -timeout=11s -rate=15 >results.bin`
2. 觀看 report
  - `vegeta report -inputs=results.bin`