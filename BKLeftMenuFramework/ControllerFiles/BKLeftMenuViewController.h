#import <UIKit/UIKit.h>
#import "UIView+Layout.h"
#import "UIView+BackgroundImageView.h"
#import "BKLeftMenuTableView.h"
#import "DarkCurtainView.h"


@interface BKLeftMenuViewController : UIViewController

//[初始化]左端菜单栏切换页面控制器
+ (instancetype)leftMenuViewController;
- (instancetype)initWithchildViewControllerArr:(NSArray*)childViewControllerArr;

//[添加自控制器]方法
- (void)addChildViewControllerToMainViewController:(UIViewController*)childViewController;

//[添加单一左端菜单栏名称]方法
- (void)addleftMenuCellLabelText:(NSString*)celllabelText;

//[添加左端菜单栏名称数组]方法
- (void)loadleftMenuCellLabelTextArray:(NSArray*)cellLabelTextArray;

//[加载右端菜单栏]方法
- (void)loadLeftMenuMainFunction;

//设置自控制[切换动画以及切换时间](不建议使用,修改切换属性会影响切换性能)
- (void)setTransitionType:(UIViewAnimationOptions)transitionType transitionTime:(CGFloat)transitionTime;

@property (nonatomic, strong) BKLeftMenuTableView *mainLeftMenuTableView;

@end
