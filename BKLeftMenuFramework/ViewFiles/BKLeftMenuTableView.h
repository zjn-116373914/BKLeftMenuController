#import <UIKit/UIKit.h>
#import "LeftMenuTableViewCellSelectActionProtocol.h"

@interface BKLeftMenuTableView : UITableView

@property(nonatomic,assign) id<LeftMenuTableViewCellSelectActionProtocol> leftMenuTableViewCellSelectActionDelagate;

@property (nonatomic, assign) NSInteger selectCellNumber;

@property (nonatomic, strong) NSArray *leftMenuCellLabelTextArr;

@end
