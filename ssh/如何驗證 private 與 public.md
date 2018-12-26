

1. 建立一個 id_rsa
2. 建議一個 id_rsa.pub
3. `diff -s <(ssh-keygen -y -f id_rsa) <(cut -d ' ' -f 1,2 id_rsa.pub)`


若正確 `Files /dev/fd/63 and /dev/fd/62 are identical`