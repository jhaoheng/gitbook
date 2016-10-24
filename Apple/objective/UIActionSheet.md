**deprecated : use UIAlertController**

```
@interface UIActionSheetViewController : UIViewController<UIActionSheetDelegate> {
 
}
```

```
- (IBAction)onMenuButton:(id)sender {
    UIActionSheet *actionSheet = [[[UIActionSheet alloc]initWithTitle:@"請選擇聯絡方式"
                                                        delegate:self
                                                        cancelButtonTitle:@"還是算了"
                                                        destructiveButtonTitle:@"特殊紅色選項"
                                                        otherButtonTitles:@"電話", @"E-Mail", nil]
                                  autorelease];
 
    //也可以透過此方式新增按鈕
    [actionSheet addButtonWithTitle:@"MSN"];
 
    //將actionSheet顯示於畫面上
    [actionSheet showInView:self.view];
}
```

```
//判斷ActionSheet按鈕事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
 
    //將按鈕的Title當作判斷的依據
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
 
    if([title isEqualToString:@"電話"]) {
        contentLabel.text = @"可惜我們目前還沒有電話";
    }
 
    else if([title isEqualToString:@"E-Mail"]) {
        contentLabel.text = @"furnacedigital@gmail.com";
    }
 
    else if([title isEqualToString:@"MSN"]) {
        contentLabel.text = @"可惜我們目前還沒有MSN";
    }
}
```


```
- (IBAction)onAboutUsButton:(id)sender {
 
NSString *aboutString = @"鑫穎數位工作室 Furnace Digital Collaboration \n\nWe Are Furnace and Never Stop Burning...\n\n\nfurnacedigital@gmail.com";
 
    UIActionSheet *actionSheet = [[[UIActionSheet alloc]initWithTitle:aboutString 
                                                        delegate:nil
                                                        cancelButtonTitle:@"返回"
                                                        destructiveButtonTitle:nil
                                                        otherButtonTitles:nil]
                                  autorelease];
 
[actionSheet showInView:self.view];
}
```