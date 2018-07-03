> 有時候需要每個node上都運行一個pod，比如監控或是日誌收集等。這時候使用Daemon Sets就非常方便。

我們用一個tomcat容器來做例子：

```
apiVersion: extensions/v1beta1
kind: DaemonSet
metadata:
  name: tomcat-ds
spec:
  template:
    metadata:
      labels:
        app: tomcat
    spec:
      containers:
      - name: tomcat
        image: tomcat:8.0.30-jre8
        ports:
        - containerPort: 8080
```

這個yaml文件和一開始的deployment的yaml文件格式很像，雖然我們沒有指定replicas，但還是起了兩個pod（因為有兩個node）。可以ssh到這兩個node上看看是不是每一個node上都啓動了一個tomcat容器。