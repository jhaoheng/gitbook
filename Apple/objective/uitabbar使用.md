## 錯誤訊息
```
Warning :-Presenting view controllers on detached view controllers is discouraged
```
此問題主要在於該 <viewController> 內容可能有不適當的 view 轉換  
此方法為 tabBar -> navi -> viewController  
但 viewController 中，非用 push，而用 presentView 造成的錯誤

## 用法
self = uiTabBarController

```
	self.tabBar.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"Bar-49pt.png"]];
    self.tabBar.selectedImageTintColor = [UIColor colorWithRed:245.0/255.0 green:78.0/255.0 blue:0.0/255.0 alpha:1.0];
    
    //清除tabbar 長相位置
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setItemSpacing:5];
    [[UITabBar appearance] setItemWidth:70];
    [[UITabBar appearance] setItemPositioning:UITabBarItemPositioningCentered];
    
    //
    UIImage *selectedImage;
    UIImage *unSelectedImage;
    NSString *title = @"";
    
    
    //量測
    title = @"驗證紀錄";
    selectedImage = [UIImage imageNamed:@"2驗證紀錄(直角正方28X28)"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    unSelectedImage = [UIImage imageNamed:@"2驗證紀錄(直角正方28X28)"];
    unSelectedImage = [unSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    FirstViewController *view1 = [[FirstViewController alloc]init];
    view1.title = title;
    view1.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:unSelectedImage selectedImage:selectedImage];
    view1.tabBarItem.imageInsets = UIEdgeInsetsMake(2, 0, -2, 0);
    CustNaviViewController *v1_navBar = [[CustNaviViewController alloc]initWithRootViewController:view1];
    v1_navBar.navigationBarHidden = NO;
    
    
    //
    //行動提款
    title = @"行動提款";
    selectedImage = [UIImage imageNamed:@"3行動提款(直角正方28X28)"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    unSelectedImage = [UIImage imageNamed:@"3行動提款(直角正方28X28)"];
    unSelectedImage = [unSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIViewController *view2 = [[UIViewController alloc]init];
    view2.title = title;
    view2.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:unSelectedImage selectedImage:selectedImage];
    view2.tabBarItem.imageInsets = UIEdgeInsetsMake(2, 0, -2, 0);
    CustNaviViewController *v2_navBar = [[CustNaviViewController alloc]initWithRootViewController:view2];
    v2_navBar.navigationBarHidden = NO;
    
    
    //動態密碼
    title = @"動態密碼";
    selectedImage = [UIImage imageNamed:@"1動態密碼(直角正方28X28)"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    unSelectedImage = [UIImage imageNamed:@"1動態密碼(直角正方28X28)"];
    unSelectedImage = [unSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    activityPwViewController *view3 = [[activityPwViewController alloc]init];
    view3.title = title;
    view3.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:unSelectedImage selectedImage:selectedImage];
    view3.tabBarItem.imageInsets = UIEdgeInsetsMake(2, 0, -2, 0);
    CustNaviViewController *v3_navBar = [[CustNaviViewController alloc]initWithRootViewController:view3];
    v3_navBar.navigationBarHidden = NO;
    
    //設定
    title = @"設定";
    selectedImage = [UIImage imageNamed:@"4設定(直角正方28X28)"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    unSelectedImage = [UIImage imageNamed:@"4設定(直角正方28X28)"];
    unSelectedImage = [unSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    SettingTableViewController *view4 = [[SettingTableViewController alloc]init];
    view4.title = title;
    view4.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:unSelectedImage selectedImage:selectedImage];
    view4.tabBarItem.imageInsets = UIEdgeInsetsMake(2, 0, -2, 0);
    CustNaviViewController *v4_navBar = [[CustNaviViewController alloc]initWithRootViewController:view4];
    v4_navBar.navigationBarHidden = NO;
    
    
    //
    self.viewControllers = [NSArray arrayWithObjects:v1_navBar,v2_navBar,v3_navBar,v4_navBar, nil];
    self.selectedIndex = 0;
```