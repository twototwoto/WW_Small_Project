//
//  AppDelegate.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/9.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "AppDelegate.h"
#import "WYWHomeCVC.h"
#import "WYWNavC.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //设置window的根控制器
    WYWHomeCVC *homeCVC = [WYWHomeCVC new];
    
    self.window.rootViewController = [[WYWNavC alloc]initWithRootViewController:homeCVC];;
    //使得window成为主窗口并且显示出来
    [self.window makeKeyAndVisible];
    
    
    
    
    return YES;
}



@end
