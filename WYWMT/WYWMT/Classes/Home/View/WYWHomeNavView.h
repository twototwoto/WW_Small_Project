//
//  WYWHomeNavView.h
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/9.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import <UIKit/UIKit.h>

//为了传递事件 使得自定义的导航视图继承自UIControl
@interface WYWHomeNavView : UIControl

//图片名
@property(nonatomic,copy) NSString *iconName;
//高亮的图片名
@property(nonatomic,copy) NSString *iconHighLightedName;
//主标题
@property(nonatomic,copy) NSString *title;
//副标题
@property(nonatomic,copy) NSString *subTitle;

+ (instancetype)homeNavView;

@end
