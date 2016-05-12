# BlueTooth



Bluetooth 的部分, 想在 iOS 上做 Bluetooth 有兩種做法:

- BLE (Bluetooth 4.0) 是不需要 MFi 認證的, 使用 CoreBluetooth API 就可以存取 BLE, 因此想用 Bluetooth 做為無線傳輸做硬體裝置 (常見的運動手環), 建議用 BLE, 不過 BLE 會有速度限制, 在 iOS 的話最快大概是 4KB/s (32Kb/s), 所以不適合傳聲音或檔案
- 假如 BLE 不合適, 那只好用 Bluetooth 2.0/3.0 (BR/EDR), 或稱做 Bluetooth Classic, 通常會選用這個是需要大資料量的傳輸, 例如藍牙耳機跟藍牙音響, 就得用 Bluetooth classic 