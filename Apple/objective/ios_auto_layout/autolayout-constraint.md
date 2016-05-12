要實現在 autolayout 中，執行取得 frame 的方法，必須要在 viewDidAppear 中，才可看到。

或者在要實現出 autolayout 的該位置後
執行

```
[autoView setNeedsLayout];
[autoView layoutIfNeeded];
```

## 文章
[Understanding Auto Layout](https://developer.apple.com/library/prerelease/mac/documentation/UserExperience/Conceptual/AutolayoutPG/)

[NSLayoutConstraint](https://developer.apple.com/library/ios/documentation/AppKit/Reference/NSLayoutConstraint_Class/index.html#//apple_ref/occ/clm/NSLayoutConstraint/constraintsWithVisualFormat:options:metrics:views:)

[Visual Format Language](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html#//apple_ref/doc/uid/TP40010853-CH27-SW1)

[Furnace iOS 程式設計中文學習網站](http://furnacedigital.blogspot.tw/2013/10/auto-layout.html)

[自動佈局學習](http://www.cnblogs.com/jamesy/p/4020595.html)


[使用NSLayoutConstraint來控制AutoLayout](https://yanwenlai.wordpress.com/2014/03/03/%E4%BD%BF%E7%94%A8nslayoutconstraint%E4%BE%86%E6%8E%A7%E5%88%B6autolayout/)