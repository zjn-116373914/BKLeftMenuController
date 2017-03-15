# BKLeftMenuController
该框架是创建一个自带左端隐藏菜单栏并且可添加子控制器的中心控制器,该中心控制器可通过左边缘手势划出左端隐藏菜单栏,并且通过点击左端隐藏菜单栏中的Cell进行子控制器的跳转切换.
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
