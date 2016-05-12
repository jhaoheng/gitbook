
當開發者選擇用 storyboard  
要注意來源，否則會有錯誤，包含參數傳遞等問題

```
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"storyboard 上的代號"];
```