//
//  BMNavigationController.m
//  WeexDemo
//
//  Created by XHY on 2017/1/12.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMNavigationController.h"
#import "CommonMacro.h"
#import "UIImage+Util.h"
#import "BMDefine.h"
#import "UINavigationBar+NavigationBarExtend.h"

@interface BMNavigationController ()

@end

@implementation BMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViews];
}

- (void)setupViews
{
    // 设置 navigationBar 背景颜色
    UIColor *setColor = [UIColor colorWithHexString:TK_PlatformInfo().page.navBarColor];
    [self.navigationBar ex_setBackgroundColor:setColor?:K_NAV_BAR_COLOR];
    
    // 设置 title
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromValue(0xffffff)}];
    [[UINavigationBar appearance] setTintColor:UIColorFromValue(0xffffff)];
    
    [self setTitleFontSize];
    
    // 注册改变字体的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTitleFontSize) name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
    
    //将返回按钮的文字position设置不在屏幕上显示
    //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin)
    //                                                         forBarMetrics:UIBarMetricsDefault];
    
    // 修改backItem默认图片
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"NavBar_BackIcon"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"NavBar_BackIcon"]];
}

- (void)setTitleFontSize
{
    NSString *fontSize = [[NSUserDefaults standardUserDefaults] objectForKey:K_FONT_SIZE_KEY];
    // 标准字体
    if (!fontSize || [fontSize isEqualToString:K_FONT_SIZE_NORM])
    {
        // 设置 title
        [self.navigationBar setTitleTextAttributes:@{ NSFontAttributeName: [UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName: UIColorFromValue(0xffffff)}];
        //        [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName: [UIFont boldSystemFontOfSize:18]}];
    }
    else if ([fontSize isEqualToString:K_FONT_SIZE_BIG])
    {
        // 设置 title
        [self.navigationBar setTitleTextAttributes:@{ NSFontAttributeName: [UIFont boldSystemFontOfSize:22], NSForegroundColorAttributeName: UIColorFromValue(0xffffff)}];
        //        [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName: [UIFont boldSystemFontOfSize:22]}];
    }
    else if ([fontSize isEqualToString:k_FONT_SIZE_EXTRALARGE])
    {
        // 设置 title
        [self.navigationBar setTitleTextAttributes:@{ NSFontAttributeName: [UIFont boldSystemFontOfSize:25], NSForegroundColorAttributeName: UIColorFromValue(0xffffff)}];
        //        [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName: [UIFont boldSystemFontOfSize:25]}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    // 销毁时移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
}

@end
