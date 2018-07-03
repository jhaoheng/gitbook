在 kubectl 中，加入 `--record`
則會在 `kubectl describe deployment <name>` 中的 `Annotations` 顯示執行的語法

此方法目的在於紀錄滾動策略的歷史紀錄
當執行 `--record` 就會在 `kubectl rollout history deployment` 中顯示一筆歷史紀錄


沒有標示 --record 的話，就會在滾動 history 中， comment 是 null