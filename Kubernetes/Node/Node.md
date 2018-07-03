# Node 管理
- 禁止 pod 調度到該節點上 : `kubectl cordon <node>`
- 允許 pod 在該節點上的調度 : `kubectl uncordon <node>`
- 驅逐該節點上的所有 pod : `kubectl drain <node>`
	- pod 被驅逐後，會在其他 node 上重新啟動
	- 使用此指令，順自動調用 `cordon`, 故當節點需要被重啟時, 須執行 `uncordon`