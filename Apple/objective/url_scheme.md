# error

in ios9

```
-canOpenURL: failed for URL: "cydia://package/com.example.package" - error: "This app is not allowed to query for scheme cydia"
```

## info

- If you call the “canOpenURL” method on a URL that is **not** in your whitelist, it will return **“NO”**, even if there is an app installed that has registered to handle this scheme. A “This app is not allowed to query for scheme xxx” syslog entry will appear.
- If you call the “openURL” method on a URL that is not in your whitelist, it will fail silently. A “This app is not allowed to query for scheme xxx” syslog entry will appear.


## finial

原因在 ios9 下，必須將 url scheme 加入 whitelist，才可以執行。