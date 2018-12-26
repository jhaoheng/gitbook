# how to use

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ViewController *baseView = [[ViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:baseView];
    self.window.rootViewController = navi;
    return YES;
}
```

# base

```
UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:baseView];
```

- navi 構成有三個
	- 本身
	- bar
	- item

# 透過繼承 navigationController

`@interface cusNaviController : UINavigationController<UINavigationControllerDelegate>`

```
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}
```

繼承後，可直接使用 will , and some else

```
#pragma mark - delegate
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    
    if(navigationController.viewControllers.count != 1) { // not the root controller - show back button instead
        return;
    }
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                                                              target:self
                                                                              action:@selector(infoItem:)];
    [viewController.navigationItem setLeftBarButtonItem:menuItem];
}

#pragma mark - info
- (void)infoItem:(id)sender
{
    infoViewController *infoView = [[infoViewController alloc] init];
    infoView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentViewController:infoView animated:YES completion:nil];
    [UIView transitionWithView:self.view
                      duration:0.75
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [self pushViewController:infoView animated:NO];
                    }
                    completion:nil];
//    [self pushViewController:infoView animated:YES];
}
```

# push by other animate

## main view

```
[UIView transitionWithView:self.navigationController.view
                      duration:0.75
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [self.navigationController pushViewController:viewcontroller animated:NO];
                    }
                    completion:nil];
```
	
	
## viewcontroller

```
- (void)viewWillDisappear:(BOOL)animated{
    [UIView transitionWithView:self.navigationController.view
                      duration:0.75
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [self.navigationController popToRootViewControllerAnimated:NO];
                    }
                    completion:nil];
}
```