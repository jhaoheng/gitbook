Objective-C 呼叫電話撥號功能通常都會使用：tel
```
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"0928123123"]]];
```
但播完就會停留在電話程式裡...

若改成：telprompt
```
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",@"0928123123"]]];
```
結束就可以回到原本的APP畫面，