# BKLeftMenuController
创建一个自带左端隐藏菜单栏的控制器,并且控制器中可以添加自控制,用左端隐藏菜单栏进行子控制器间切换(左端隐藏菜单栏可通过左边缘手势划出)
实例:
    UIViewController *firstViewCtl = [[UIViewController alloc] init];
    firstViewCtl.view.backgroundColor = [UIColor redColor];
    UIViewController *secondViewCtl = [[UIViewController alloc] init];
    secondViewCtl.view.backgroundColor = [UIColor blueColor];
    
    /**框架外核心代码**/
    BKLeftMenuViewController *mainViewCtl = [[BKLeftMenuViewController leftMenuViewController] initWithchildViewControllerArr:@[firstViewCtl, secondViewCtl]];
    [mainViewCtl loadleftMenuCellLabelTextArray:@[@"第1页", @"第2页"]];
    [mainViewCtl loadLeftMenuMainFunction];
    /**--------------------------------------**/
