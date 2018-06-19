# gstreamer
- 目的 : 透過 gstreamer 將，picamera 的 stream 透過 rtmp 傳給 media-server

## 安裝主程式
> 可將檔案以 rtmp 串流，推送到 rtmp media-server

- `apt-get install gstreamer1.0-tools`
- 但主程式只能推送檔案，無法推送 raspicam 的影像

## 安裝 plugin
> 可將 raspicam 的影像推出

- repo : use https://github.com/thaytan/gst-rpicamsrc
	- 透過 `apt-get install gstreamer1.0-tools` 安裝的方式，無法抓取 picamera 的 stream
- install dep : `apt-get install autoconf automake libtool pkg-config libgstreamer1.0-dev \
 libgstreamer-plugins-base1.0-dev libraspberrypi-dev -y`
- build gst-rpicamsrc
	1. `git clone https://github.com/thaytan/gst-rpicamsrc.git`
	2. `cd gst-rpicamsrc/`
	3. `./autogen.sh --prefix=/usr --libdir=/usr/lib/arm-linux-gnueabihf/`
	4. `make && make install`
- start push stream

```
gst-launch-1.0 -v rpicamsrc \
 ! 'video/x-h264,width=1280,height=720,framerate=15/1' \
 ! h264parse ! flvmux \
 ! rtmpsink location="rtmp://media-test.gotomythings.com/live/pi"
```

# 參考文章
- [How to stream from RaspberryPi PiCamera](http://c.wensheng.org/2017/05/18/stream-from-raspberrypi/)