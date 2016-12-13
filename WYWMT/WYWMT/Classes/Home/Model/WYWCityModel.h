//
//  WYWCityModel.h
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/13.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYWDistrictModel.h"

@interface WYWCityModel : NSObject

/**
 名字
 */
@property(nonatomic,copy) NSString *name;

/**
 拼音全称
 */
@property(nonatomic,copy) NSString *pinYin;

/**
 拼音缩写
 */
@property(nonatomic,copy) NSString *pinYinHead;
@property (nonatomic,strong) NSArray<WYWDistrictModel *> *districts;
@end
