//
//  ViewController.m
//  BKLeftMenuControllerDemo
//
//  Created by 张加宁 on 2017/3/13.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import "ViewController.h"
#import "BKLeftMenuViewController.h"

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
    UINavigationController *firstViewNVCtl = [[UINavigationController alloc] initWithRootViewController:firstViewCtl];
    
    UIViewController *secondViewCtl = [[UIViewController alloc] init];
    UINavigationController *secondViewNVCtl = [[UINavigationController alloc] initWithRootViewController:secondViewCtl];
    secondViewCtl.title = @"第二页面";
    [secondViewCtl.view setBackgroundImageViewFromImage:[UIImage imageNamed:@"Image2_Kerrigan"]];
    
    UIViewController *thirdViewCtl = [[UIViewController alloc] init];
    UINavigationController *thirdViewNVCtl = [[UINavigationController alloc] initWithRootViewController:thirdViewCtl];
    thirdViewCtl.title = @"第三页面";
    [thirdViewCtl.view setBackgroundImageViewFromImage:[UIImage imageNamed:@"Image3_Tassadar"]];
    
    /**框架外核心代码**/
    BKLeftMenuViewController *mainViewCtl = [[BKLeftMenuViewController leftMenuViewController] initWithchildViewControllerArr:@[firstViewNVCtl,secondViewNVCtl,thirdViewNVCtl]];
    [mainViewCtl loadleftMenuCellLabelTextArray:@[@"第一页",@"第二页",@"第三页"]];
//    [mainViewCtl setTransitionType:UIViewAnimationOptionTransitionFlipFromLeft transitionTime:0.5];
    [mainViewCtl loadLeftMenuMainFunction];
    /**--------------------------------------**/
    
    [self presentViewController:mainViewCtl animated:YES completion:nil];
}



@end
