//
//  WYWDistrictVC.h
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/12.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYWPopoverView.h"
#import "WYWDistrictModel.h"

@interface WYWDistrictVC : UIViewController
@property (nonatomic,strong) WYWPopoverView *popoverView;


/**
 区域数据
 */
@property (nonatomic,strong) NSArray<WYWDistrictModel *> *districts;

@end
