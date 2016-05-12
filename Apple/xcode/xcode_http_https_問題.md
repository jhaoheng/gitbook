# 在 xcode 使用 http

## info
[develop forums](https://forums.developer.apple.com/thread/4017)
> today I read that iOS 9 is forcing connections that are using HTTPS to be TLS 1.2 to avoid recent vulnerabilities. So you have to ensure that your web server supports this version of the protocol. 

## how to do
xcode 僅能使用 https，要在上面更改可以直接使用 http，必須調整 plist 上的設定  
讓該 ip or dns 變成允許清單中的一份子
[Security Exceptions in iOS 9](http://ste.vn/2015/06/10/configuring-app-transport-security-ios-9-osx-10-11/)

這東西叫 APP Transport Security(ATS)

在 plist 中新增此要素，目前不支援 TLSv1.2

```
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSExceptionDomains</key>
  <dict>
    <key>yourserver.com</key>
    <dict>
      <!--Include to allow subdomains-->
      <key>NSIncludesSubdomains</key>
      <true/>
      <!--Include to allow HTTP requests-->
      <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
      <true/>
      <!--Include to specify minimum TLS version-->
      <key>NSTemporaryExceptionMinimumTLSVersion</key>
      <string>TLSv1.1</string>
    </dict>
  </dict>
</dict>
```

## name
App Transport Security Settings
