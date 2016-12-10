//
//  WYWHomeNavView.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/9.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "WYWHomeNavView.h"

@interface WYWHomeNavView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *navBtn;


@end

@implementation WYWHomeNavView

+ (instancetype)homeNavView{
//WWAnnotation: 别忘了下边的内容是个数组 需要取出来lastObject 而且要注意下边的nibName需要是相应的xib的名字
    return [[NSBundle mainBundle]loadNibNamed:@"WYWHomeView" owner:nil options:nil].lastObject;
}

- (void)setIconName:(NSString *)iconName{
    _iconName = iconName;
    //设置图片
    [self.navBtn setImage:[UIImage imageNamed: _iconName] forState:UIControlStateNormal];
    
}

- (void)setIconHighLightedName:(NSString *)iconHighLightedName{
    //设置高亮图片
    _iconHighLightedName = iconHighLightedName;
    [self.navBtn setImage:[UIImage imageNamed:_iconHighLightedName] forState:UIControlStateHighlighted];
}
/**
//WWAnnotation:注意：我们设置的高亮图片如果是不能正常的显示的话有这么几种情况
    1.相应的set方法没有正确地设置好
    2.图片的渲染模式不对
    3.相应的设置图片的方式不对
    4.slice切图的时候不对
 */
//- (void)setIconHighLighLightedName:(NSString *)iconHighLightedName{
//    //设置高亮图片
//    _iconHighLightedName = iconHighLightedName;
//    [self.navBtn setImage:[UIImage imageNamed:_iconHighLightedName] forState:UIControlStateHighlighted];
//    
//}

- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLabel.text = title;
}

- (void)setSubTitle:(NSString *)subTitle{
    _subTitle = subTitle;
    _subTitleLabel.text = _subTitle;
}


- (IBAction)clickNavBtn:(id)sender {
    //生成Action-Target事件
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}










@end
