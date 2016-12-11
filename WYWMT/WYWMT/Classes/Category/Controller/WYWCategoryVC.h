//
//  WYWCategoryVC.h
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/10.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYWPopoverView.h"

@interface WYWCategoryVC : UIViewController
//为了在外界能够在设置popover的视图的大小，把这个暴露出去
@property (nonatomic,strong) WYWPopoverView *popoverView;
@end
