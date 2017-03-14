#import "BKLeftMenuTableView.h"

//宏定义屏幕长宽以及其他参数
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49


@interface BKLeftMenuTableView()<UITableViewDataSource, UITableViewDelegate>


@end

@implementation BKLeftMenuTableView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.dataSource = self;
        self.delegate = self;
        self.tableFooterView = [[UIView alloc] init];
        self.backgroundColor = [UIColor lightGrayColor];
        self.rowHeight = (ScreenHeight-HeadHeight)/10.0;
        
    }
    return self;
}


#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSections
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.selectCellNumber ==0)
    {
        return 1;
    }
    else
    {
        return self.selectCellNumber;
    }
 
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewCell *mainCell = [[UITableViewCell alloc] init];
    
    mainCell.backgroundColor = [UIColor grayColor];
    [mainCell.textLabel setFont:[UIFont systemFontOfSize:25]];
    mainCell.textLabel.text = [self.leftMenuCellLabelTextArr objectAtIndex:indexPath.row];
    return mainCell;

}


#pragma mark -------------------------------------------------------

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.leftMenuTableViewCellSelectActionDelagate LeftMenuTableViewCellSelectActionWithIndexRow:indexPath.row];
}

#pragma mark -------------------------------------------------------

@end
