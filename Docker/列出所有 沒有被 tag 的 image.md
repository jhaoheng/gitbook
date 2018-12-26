# 列出所有 沒有被 tag 的 image

- `docker images -f "dangling=true" -q`
- 刪除 : `docker rmi $(docker images -f "dangling=true" -q)`