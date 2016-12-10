//
//  NSString+HMCategory.h
//  MeiTuanHD
//
//  Created by apple on 16/8/5.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HMCategory)

/** 专门处理商品价格, 返回字符串*/
- (instancetype)dealPriceString;

- (NSString *)URLEncodedString;

@end
