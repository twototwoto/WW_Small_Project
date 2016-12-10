//
//  WYWPopoverView.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/10.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "WYWPopoverView.h"

@implementation WYWPopoverView

+(instancetype)popoverView{
    return [[NSBundle mainBundle]loadNibNamed:@"WYWPopoverView" owner:nil options:nil].lastObject;
}


@end
