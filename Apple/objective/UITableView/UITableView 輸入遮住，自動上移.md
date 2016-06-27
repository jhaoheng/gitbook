# UITableView 輸入遮住，自動上移


## 監聽事件
 
```
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
```

## 實現方法

```
- (void)keyboardWillShow:(NSNotification *)info
{
    CGRect keyboardBounds = [[[info userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _tableView.contentInset = UIEdgeInsetsMake(_tableView.contentInset.top, 0, keyboardBounds.size.height, 0);

}
- (void)keyboardWillHide:(NSNotification *)info
{
    _tableView.contentInset = UIEdgeInsetsMake(_tableView.contentInset.top, 0, 0, 0);
}
```

## 移除監聽

```
- (void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
```