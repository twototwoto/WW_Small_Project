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


@end
