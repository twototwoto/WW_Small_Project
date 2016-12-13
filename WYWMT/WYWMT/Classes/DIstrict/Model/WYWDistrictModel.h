//
//  WYWDistrictModel.h
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/13.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYWDistrictModel : NSObject

/**
 名字
 */
@property (nonatomic,copy) NSString *name;

/**
 子区域数据
 */
//@property (nonatomic,strong) NSArray *subDistricts;
//MARK: - 注意这种plist文件中的数据对应的模型中的属性的时候一定要赋值粘贴过来，别想当然的去拼写，否则是拿不到数据的;
@property (nonatomic,strong) NSArray *subdistricts;

@end
