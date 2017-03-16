//
//  ViewController.m
//  BKLeftMenuControllerDemo
//
//  Created by 张加宁 on 2017/3/13.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import "ViewController.h"
#import "BKLeftMenuViewMainController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)presentViewControllerAction:(UIButton *)sender
{
    UIViewController *firstViewCtl = [[UIViewController alloc] init];
    firstViewCtl.title = @"第一页面";
    [firstViewCtl.view setBackgroundImageViewFromImage:[UIImage imageNamed:@"Image1_Zeratual"]];
    UIBarButtonItem *firstViewCtlNavLeftBtn = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(navigationLeftBtnAction)];
    firstViewCtl.navigationItem.leftBarButtonItem = firstViewCtlNavLeftBtn;
    UINavigationController *firstViewNVCtl = [[UINavigationController alloc] initWithRootViewController:firstViewCtl];
    
    UIViewController *secondViewCtl = [[UIViewController alloc] init];
    secondViewCtl.title = @"第二页面";
    [secondViewCtl.view setBackgroundImageViewFromImage:[UIImage imageNamed:@"Image2_Kerrigan"]];
    UIBarButtonItem *secondViewCtlNavLeftBtn = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(navigationLeftBtnAction)];
    secondViewCtl.navigationItem.leftBarButtonItem = secondViewCtlNavLeftBtn;
    UINavigationController *secondViewNVCtl = [[UINavigationController alloc] initWithRootViewController:secondViewCtl];
    
    UIViewController *thirdViewCtl = [[UIViewController alloc] init];
    thirdViewCtl.title = @"第三页面";
    UIBarButtonItem *thirdViewCtlNavLeftBtn = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(navigationLeftBtnAction)];
    thirdViewCtl.navigationItem.leftBarButtonItem = thirdViewCtlNavLeftBtn;
    [thirdViewCtl.view setBackgroundImageViewFromImage:[UIImage imageNamed:@"Image3_Tassadar"]];
    UINavigationController *thirdViewNVCtl = [[UINavigationController alloc] initWithRootViewController:thirdViewCtl];
    
    /**框架外[核心代码]**/
    BKLeftMenuViewMainController *mainViewCtl = [[BKLeftMenuViewMainController leftMenuViewMainController] initWithchildViewControllerArr:@[firstViewNVCtl,secondViewNVCtl,thirdViewNVCtl]];
    [mainViewCtl loadleftMenuCellLabelTextArray:@[@"第1页",@"第2页",@"第3页"]];
    [mainViewCtl loadLeftMenuMainFunction];
    /**--------------------------------------**/
    
    
//    [mainViewCtl setTransitionType:UIViewAnimationOptionTransitionFlipFromLeft transitionTime:0.5];
    [self presentViewController:mainViewCtl animated:YES completion:nil];
    
}


- (void)navigationLeftBtnAction
{
    BKLeftMenuViewMainController *mainViewCtl = [BKLeftMenuViewMainController leftMenuViewMainController];
    [mainViewCtl showLeftMenuTableView];
    
}


@end


