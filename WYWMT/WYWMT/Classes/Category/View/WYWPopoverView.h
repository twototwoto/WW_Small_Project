//
//  WYWPopoverView.h
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/10.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYWPopoverView : UIView
+(instancetype)popoverView;
//WWAnnotation:把一次菜单和二级菜单暴露出来便于后期的数据源的设置
//一级菜单
@property (weak, nonatomic) IBOutlet UITableView *leftTable;
//二级菜单
@property (weak, nonatomic) IBOutlet UITableView *rightTable;

@end
