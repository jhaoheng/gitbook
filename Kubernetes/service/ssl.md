# ssl

在 service 建立 ssl, 是無法的
service 只能將 port 轉移到 pod 支援 ssl 的 port
由 pod 中的 container 來建立 ssl 的連線