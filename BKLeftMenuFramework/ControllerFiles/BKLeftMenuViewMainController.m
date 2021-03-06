#import "BKLeftMenuViewMainController.h"

/**宏定义屏幕长宽以及其他参数**/
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49


@interface BKLeftMenuViewMainController ()<LeftMenuTableViewCellSelectActionProtocol>
{
    UIViewController *_currentViewController;
    
    UIViewAnimationOptions _transitionType;
    CGFloat _transitionTime;
    
}

/**这个属性是重点,必须现在控制器中定义一个View,并且这View不能添加跳转的点击事件**/
@property (strong, nonatomic) UIView *MainView;

@property (nonatomic, strong) DarkCurtainView *darkCurtainView;

/**存放子控制器的数组**/
@property (nonatomic, strong) NSMutableArray *childViewControllerMarr;
@property (nonatomic, strong) NSMutableArray *leftMenuCellLabelTextMarr;

@end

@implementation BKLeftMenuViewMainController
#pragma mark - 系统方法
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.childViewControllerMarr = [[NSMutableArray alloc] init];
        self.leftMenuCellLabelTextMarr = [[NSMutableArray alloc] init];
        
        _transitionType = UIViewAnimationOptionTransitionNone;
        _transitionTime = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
#pragma mark -------------------------------------------------------

#pragma mark - [外部开放]方法
/**[单例初始化]左端菜单栏切换页面中心控制器**/
+ (BKLeftMenuViewMainController*)leftMenuViewMainController
{
    static BKLeftMenuViewMainController *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      singleton = [[BKLeftMenuViewMainController alloc] init];
                  });
    return singleton;
}

/**[构造方法]左端菜单栏切换页面中心控制器**/
- (instancetype)initWithchildViewControllerArr:(NSArray*)childViewControllerArr
{
    self = [super init];
    if (self)
    {
        self.childViewControllerMarr = [[NSMutableArray alloc] init];
        self.childViewControllerMarr = [NSMutableArray arrayWithArray:childViewControllerArr];
        self.leftMenuCellLabelTextMarr = [[NSMutableArray alloc] init];
        
        _transitionType = UIViewAnimationOptionTransitionNone;
        _transitionTime = 0;
    }
    return self;
}


/**[单一添加子控制器]方法**/
- (void)addChildViewControllerToMainViewController:(UIViewController*)childViewController
{
    [self.childViewControllerMarr addObject:childViewController];
    
}

/**[单一添加左端菜单栏Cell文字]方法**/
- (void)addleftMenuCellLabelText:(NSString*)celllabelText
{
    [self.leftMenuCellLabelTextMarr addObject:celllabelText];
}

/**[添加左端菜单栏Cell文字数组]方法**/
- (void)loadleftMenuCellLabelTextArray:(NSArray*)cellLabelTextArray
{
    self.leftMenuCellLabelTextMarr = [NSMutableArray arrayWithArray:cellLabelTextArray];
}



/**完成左端菜单栏以及子控制器[最终加载主方法]**/
- (void)loadLeftMenuMainFunction
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.MainView];
    
    //加载可切换型子控制
    for (UIViewController *childViewController in self.childViewControllerMarr)
    {
        UIBarButtonItem *navigationLeftBtn = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(showLeftMenuTableView)];
        [childViewController.childViewControllers firstObject].navigationItem.leftBarButtonItem = navigationLeftBtn;
        
        [self addChildViewController:childViewController];
        [self.MainView addSubview:childViewController.view];
        childViewController.view.hidden = YES;
    }
    
    _currentViewController = [self.childViewControllerMarr firstObject];
    _currentViewController.view.hidden = NO;
    //----------------------------------------------------------------

    //加载左端菜单栏试图
    self.mainLeftMenuTableView.selectCellNumber = self.childViewControllerMarr.count;
    self.mainLeftMenuTableView.leftMenuCellLabelTextArr = [NSArray arrayWithArray:self.leftMenuCellLabelTextMarr];
    [self.view addSubview:self.darkCurtainView];
    [self.view addSubview:self.mainLeftMenuTableView];
    //----------------------------------------------------------------
    
    //左边缘手势
    UIScreenEdgePanGestureRecognizer *screenEdgeFromLeft = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(showLeftMenuTableView)];
    screenEdgeFromLeft.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:screenEdgeFromLeft];
    //----------------------------------------------------------------
}

/**设置自控制[切换动画以及切换时间](不建议使用,修改切换属性会影响切换性能)**/
- (void)setTransitionType:(UIViewAnimationOptions)transitionType transitionTime:(CGFloat)transitionTime
{
    _transitionType = transitionType;
    _transitionTime = transitionTime;
}

#pragma mark -------------------------------------------------------



#pragma mark - 左端菜单栏[显示]与[隐藏]方法
/**左端菜单栏[显示]方法**/
- (void)showLeftMenuTableView
{
    [UIView animateWithDuration:0.5 animations:^
     {
         [self.mainLeftMenuTableView setFrame:CGRectMake(0, self.mainLeftMenuTableView.y, self.mainLeftMenuTableView.width, self.mainLeftMenuTableView.height)];
     }];
    
    [self.darkCurtainView setFrame:CGRectMake(0, 0, self.darkCurtainView.width, self.darkCurtainView.height)];
}


/**左端菜单栏[隐藏]方法**/
- (void)dismissLeftMenuTableView
{
    [UIView animateWithDuration:0.5 animations:^
     {
         [self.mainLeftMenuTableView setFrame:CGRectMake(-self.mainLeftMenuTableView.width, self.mainLeftMenuTableView.y, self.mainLeftMenuTableView.width, self.mainLeftMenuTableView.height)];
     }];
    
    [self.darkCurtainView setFrame:CGRectMake(-self.darkCurtainView.width, 0, self.darkCurtainView.width, self.darkCurtainView.height)];
}
#pragma mark -------------------------------------------------------



#pragma mark - LeftMenuTableViewCellSelectActionProtocol-左端隐藏菜单栏[Cell点击事件]协议方法
/**左端隐藏菜单栏Cell点击的协议方法**/
- (void)LeftMenuTableViewCellSelectActionWithIndexRow:(NSInteger)indexRow
{
    [self dismissLeftMenuTableView];
    
    UIViewController *oldViewCtl = _currentViewController;
    UIViewController *selectViewController = self.childViewControllerMarr[indexRow];
    if(oldViewCtl != selectViewController)
    {
        [self transitionFromViewController:oldViewCtl toViewController:selectViewController duration:_transitionTime options:_transitionType animations:nil completion:^(BOOL finished)
         {
             if(finished)
             {
                 oldViewCtl.view.hidden = YES;
                 _currentViewController = selectViewController;
                 _currentViewController.view.hidden = NO;
             }
             else
             {
                 _currentViewController = oldViewCtl;
             }
         }];
    }
    
}


#pragma mark -------------------------------------------------------


#pragma mark - GettingAndSetting - 全局试图变量加载前预处理
/**左端隐藏菜单栏TableView**/
-(BKLeftMenuTableView *)mainLeftMenuTableView
{
    if(!_mainLeftMenuTableView)
    {
        _mainLeftMenuTableView = [[BKLeftMenuTableView alloc] init];
        _mainLeftMenuTableView.width = ScreenWidth/2.0;
        _mainLeftMenuTableView.height = ScreenHeight;
        _mainLeftMenuTableView.x = -_mainLeftMenuTableView.width;
        _mainLeftMenuTableView.y = HeadHeight;
        
        
        UISwipeGestureRecognizer *swipeToLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissLeftMenuTableView)];
        swipeToLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [_mainLeftMenuTableView addGestureRecognizer:swipeToLeft];
        
        _mainLeftMenuTableView.leftMenuTableViewCellSelectActionDelagate = self;
    }
    
    return _mainLeftMenuTableView;
}

/**子控制器载体试图UIView**/
-(UIView *)MainView
{
    if(!_MainView)
    {
        _MainView = [[UIView alloc] init];
        _MainView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        _MainView.backgroundColor = [UIColor whiteColor];
    }
    
    return _MainView;
}

/**黑幕变暗特性UIView**/
-(DarkCurtainView *)darkCurtainView
{
    if(!_darkCurtainView)
    {
        _darkCurtainView = [[DarkCurtainView alloc] init];
        _darkCurtainView.width = ScreenWidth;
        _darkCurtainView.height = ScreenHeight;
        _darkCurtainView.x = -_darkCurtainView.width;
        _darkCurtainView.y = 0;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissLeftMenuTableView)];
        [_darkCurtainView addGestureRecognizer:tap];
    }
    
    return _darkCurtainView;
}


#pragma mark -------------------------------------------------------

@end
