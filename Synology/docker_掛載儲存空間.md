## 如何在 docker 中掛載 nas 路徑下的 folder

範例環境：docker、centOs7

1. 停止你的 docker/application(centOs7)
2. docker -> 容器 -> 選擇 application(centOs7) -> 編輯 -> 儲存空間
3. 新增資料夾(/docker/centos7_home)，掛載路徑選擇 `/home/`
4. 啟動 application(centOs7)
5. 將資料放入 centos7_home，可看到 /home/ 同步更新
