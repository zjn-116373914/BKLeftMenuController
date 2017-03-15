#import "UIView+BackgroundImageView.h"

//宏定义屏幕长宽以及其他参数
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49

@implementation UIView (BackgroundImageView)
- (void)setBackgroundImageViewFromImage:(UIImage*)image
{
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    backgroundImageView.image = image;
    [self addSubview:backgroundImageView];
}


@end
