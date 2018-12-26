# 設定
> 讓所有使用相同的 security group 的 instance 都可以 access 到 某個 instance

1. 設定好兩個 server, a & b
2. 要用 b , ping 得到 a
3. 在 a 的 security 中, 設定 b 的 group-name
4. 進入 b 的 server 中, `ping a-private-ip`, 不能 ping public ip