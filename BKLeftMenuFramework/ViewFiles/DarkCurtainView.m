#import "DarkCurtainView.h"

@interface DarkCurtainView()

@end

@implementation DarkCurtainView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.8;
    }
    return self;
}



@end
