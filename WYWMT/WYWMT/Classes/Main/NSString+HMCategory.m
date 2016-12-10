//
//  NSString+HMCategory.m
//  MeiTuanHD
//
//  Created by apple on 16/8/5.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NSString+HMCategory.h"

@implementation NSString (HMCategory)
/**
            总长度      小数点位置
 99.99         5            2
 99.999        6            2
 如果总长度 - 小数点位置 > 3 , 就代表需要截取
 
 99.900000000001 --> 99.9
 99.989999999999 --> 99.99
 */
/**
 需求分析:
 1. 判断小数点位置, 小数点超出2位的都需要删除
 2. 如果删除之后, 末尾为0, 需要再删除一位
 3. 如果删除之后, 末尾为8, 把8替换成9
 */


/** 专门处理商品价格, 返回字符串*/
- (instancetype)dealPriceString
{
    
    //1 获取当前价格字符串
    NSString *priceString = self;
    
    //2 获取小数点位置 range: lenth location
    // location是小数点之前的位置, 要从小数点开始截取, 还需要加1
    NSInteger location = [priceString rangeOfString:@"."].location;
    
    //3 如果需要截取
    //一定要加这个判断, 否则, 找不到就会返回NSInteger的最大值
    if (location != NSNotFound) {
        if (priceString.length - location > 3) {
            
            //4 先截取到小数点后2位
            priceString = [priceString substringToIndex:location + 3];
            
            //5 如果删除之后, 末尾为0, 需要再删除一位
            if ([priceString hasSuffix:@"0"]) {
                priceString = [priceString substringToIndex:priceString.length - 1];
            }
            
            //6 如果删除之后, 末尾为8, 把8替换成9
            if ([priceString hasSuffix:@"8"]) {
                priceString = [priceString stringByReplacingCharactersInRange:NSMakeRange(priceString.length - 1, 1) withString:@"9"];
//                priceString = [currentPriceString priceString - 1];
//                priceString = [currentPriceString stringByAppendingString:@"9"];
            }
            
            NSLog(@"要截取: %@", priceString);
        }
    }
    return priceString;
}

- (NSString *)URLEncodedString
{
    NSString *encodedString = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8));
    return encodedString;
}

@end
