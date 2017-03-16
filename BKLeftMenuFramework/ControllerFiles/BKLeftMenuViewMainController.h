#import <UIKit/UIKit.h>
#import "UIView+Layout.h"
#import "UIView+BackgroundImageView.h"
#import "BKLeftMenuTableView.h"
#import "DarkCurtainView.h"


@interface BKLeftMenuViewMainController : UIViewController

//[单例初始化]左端菜单栏切换页面中心控制器
+ (instancetype)leftMenuViewMainController;
- (instancetype)initWithchildViewControllerArr:(NSArray*)childViewControllerArr;

//[单一添加子控制器]方法
- (void)addChildViewControllerToMainViewController:(UIViewController*)childViewController;

//[单一添加左端菜单栏Cell文字]方法
- (void)addleftMenuCellLabelText:(NSString*)celllabelText;
//[添加左端菜单栏Cell文字数组]方法
- (void)loadleftMenuCellLabelTextArray:(NSArray*)cellLabelTextArray;

//设置子控制器[切换动画以及切换时间](不建议使用,修改切换属性会影响切换性能)
- (void)setTransitionType:(UIViewAnimationOptions)transitionType transitionTime:(CGFloat)transitionTime;

//完成左端菜单栏以及子控制器[最终加载主方法]
- (void)loadLeftMenuMainFunction;


//左端菜单栏[显示]方法
- (void)showLeftMenuTableView;
//左端菜单栏[隐藏]方法
- (void)dismissLeftMenuTableView;

//左端菜单栏TableView试图
@property (nonatomic, strong) BKLeftMenuTableView *mainLeftMenuTableView;

@end


