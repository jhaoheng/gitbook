# 常量

## 字串常量
```
const (
    CCVisa            = "Visa"
    CCMasterCard      = "MasterCard"
    CCAmericanExpress = "American Express"
)
```

## 數字常量
```
const (
    CategoryBooks    = 0
    CategoryHealth   = 1
    CategoryClothing = 2
)
```

## 自增長

利用 iota 的標識符

```
const (
    CategoryBooks = iota // 0
    CategoryHealth       // 1
    CategoryClothing     // 2
)
```

## Skipping Values
```
type AudioOutput int

const (
    OutMute AudioOutput = iota // 0
    OutMono                    // 1
    OutStereo                  // 2
    _
    _
    OutSurround                // 5
)
```