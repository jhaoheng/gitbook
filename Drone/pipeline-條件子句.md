# 條件子句

- Branch
- Event
- Status
- Environment
- Matrix

## Matrix

```
when:
	matrix:
		GO_VERSION: 1.8
		REDIS_VERSION: 2.8
```

### 只有測試成功才執行...

```
when:
	event: [ push, pull_request ]
	status: [ success ] # 只有測試成功才執行
```

### 只有 git 上傳 tag 才跑 depoly

```
when:
	event: [ tag ] # 限制 git tag
	branch: [ refs/tags/china* ] # 限制標籤為 china
```

### 成功或失敗都通知訊息
```
when:
	status: [ success, failure ]
```