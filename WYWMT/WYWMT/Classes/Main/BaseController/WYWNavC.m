//
//  WYWNavC.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/9.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "WYWNavC.h"

@interface WYWNavC ()

@end

@implementation WYWNavC

//类首次被使用的时候调用  应用只会调用一次
+ (void)initialize{
    //设置导航栏主体的背景图  项目中的UINavigationBar默认背景图都会改变
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}











@end
