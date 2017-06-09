# git tag
設定 tag 的原因在於，若在 tree 中，有某個版本，想特別的標注，這是第幾個版本，則可用加入 tag 的方式，讓 tree 更清楚的呈現

## 建立一個含有註解的 tag
```
git tag -a v0.1 -m '註解'
```

## 顯示該 tag 內容
```
git show v0.1
```

## 顯示所有 tag list
- git tag -l

## 將 tag 推到 remote 上
```
git push origin v1.5
```
## 一次將所有 tag 推上去
```
git push origin --tags
```

## 修改 tab message 

```
git tag <tag name> <tag name> -f -m "<new message>"
```

## 刪除

- 刪除 remote : `git push --delete origin tagname`
- 刪除本地 : `git tag --delete tagname`