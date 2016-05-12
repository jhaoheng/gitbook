## 使用 MFMailComposeViewController

**調用後，不離開原本的 app**

https://developer.apple.com/library/ios/documentation/MessageUI/Reference/MFMailComposeViewController_class/index.html

```
// From within your active view controller
if([MFMailComposeViewController canSendMail]) {
    MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
    mailCont.mailComposeDelegate = self;

    [mailCont setSubject:@"yo!"];
    [mailCont setToRecipients:[NSArray arrayWithObject:@"joel@stackoverflow.com"]];
    [mailCont setMessageBody:@"Don't ever want to give you up" isHTML:NO];

    [self presentModalViewController:mailCont animated:YES];
    [mailCont release];
}


// Then implement the delegate method
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissModalViewControllerAnimated:YES];
}
```

## 使用 shareApplication 特性

**調用後，會離開原本的 app**

```
    //設定主旨
    NSString *subject = @"Never Stop Bruning";
    
    //設定內文
    NSString *text = @"hello!!";
    
    //設定收件人的Email並帶入主旨與內文
    NSString *url = [NSString stringWithFormat:@"mailto://jhaoheng@gmail.com?subject=%@&body=%@", subject, text];
    
    //重新格式化字串為UTF8
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* mailURL = [NSURL URLWithString:@"mailto://"];
    if ([[UIApplication sharedApplication] canOpenURL:mailURL]) {
        [[UIApplication sharedApplication] openURL:mailURL];
    }

```