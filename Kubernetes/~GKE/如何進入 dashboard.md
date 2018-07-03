1. 先取得 gke 的 cluster 憑證 : `gcloud container clusters get-credentials {CLUSTER_NAME}`
	- 建立完成後，可在 `cd $HOME/.kube` 中, 查詢到 config 的設定檔
2. 確認目前使用的 config : `kubectl config get-contexts` 與 `kubectl config current-context`
3. 執行 `kubectl proxy` : 會顯示出網址 127.0.0.1:<port>
4. 在 browser 上，輸入 127.0.0.1:<port>/ui
	- 驗證方式選擇輸入 token, 取得 token : `cat $HOME/.kube/config` 中 users.user.auth-provider.config.access-token