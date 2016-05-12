## path

```usr/include/TargetConditional.h```

## explain

這邊用於 Target 的物件。

像是 simulator / iphone 6s / iphone 6s plus 等目標物。

在程式中可用來判斷
當你執行於 simulator 時，要怎麼設計  
執行 tvos / watchos 時，要怎麼設計....等等

## example 

```
if (TARGET_IPHONE_SIMULATOR) {
        NSLog(@"simulator");
}
```

