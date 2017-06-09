http://www.atjiang.com/persistent-storage-and-shared-state-with-volumes-in-docker/
# Data volumes

如果是用 -v ~/max
則會同時在 container 的 ~ 位置底下，建立 max 資料夾

可透過 docker inspect [container]
來查看 mount 的資料

# Mount a host directory as a data volume
Docker Volume 是個介於主機與容器間的共享資料夾，可用來匯入或匯出容器內的資料，或者共享容器間的資料
-v <host path>:<container path>:<權限>
但一般也可以用 docker cp 來進行互動

- 權限
	- 預設為可讀可寫
	- ro : 唯獨
	- cached

	
# volume driver
- default : local
	- convoy 是一個驅動的格式 : https://github.com/rancher/convoy#quick-start-guide
		- Convoy 是 docker 的一个存储卷插件，起一个中介容器的作用：确保容器的数据卷链接到共享存储，目前实现了 NFS 和 Gluster 两种共享存储的支持，其他共享存储的支持据说“即将”实现。
- docker volume create --help 可查看