//
//  WYWCityModel.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/13.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "WYWCityModel.h"

@implementation WYWCityModel

//容器类属性： 如果需要YYModel 转换出模型中的集合属性的元素也是模型，可以使用该方法

//返回容器类中的所需要存放的数据类型(以Class或Class Name 的形式)
+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"districts":[WYWDistrictModel class]};
}

@end
