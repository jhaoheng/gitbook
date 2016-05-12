## 捲動到最下方
```
CGPoint bottomOffset = CGPointMake(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
[self.scrollView setContentOffset:bottomOffset animated:YES];
```

## 關於 touch 
若要在 scrollView 中使用 touchBegin 等 method  
必須要重設 touch 的服務  
盡量不要這樣做