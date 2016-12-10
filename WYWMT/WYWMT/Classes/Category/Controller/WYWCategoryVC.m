//
//  WYWCategoryVC.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/10.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "WYWCategoryVC.h"
#import "WYWPopoverView.h"


@interface WYWCategoryVC ()

@end

@implementation WYWCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加下拉视图
    UIView *popoverView = [WYWPopoverView popoverView];
    [self.view addSubview:popoverView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
