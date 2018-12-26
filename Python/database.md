# 同步資料庫

> 將設定好的 model 同步到 django.setting 中所設定的資料庫位置

- 這個指令會根據你對 Model 的修改刪除建立一個新的 migration 檔案，讓 migrate 指令執行時，可以照著這份紀錄更新資料庫。

1. 先建立資料庫的 .py script, 利用 `python manage.py makemigrations`
	- 將 model 中的設定值，變成 .py script
2. 再利用 `python manage.py migrate` 進行轉移設定

