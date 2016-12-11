//
//  WYWCategoryModel.h
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/10.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYWCategoryModel : NSObject


/**
 高亮图标
 */
@property (nonatomic,strong) NSString *highlighted_icon;

/**
 图标
 */
@property (nonatomic,strong) NSString *icon;

/**
 名称
 */
@property (nonatomic,strong) NSString *name;

/**
 小图标
 */
@property (nonatomic,strong) NSString *small_highlighted_icon;

/**
 高亮小图标
 */
@property (nonatomic,strong) NSString *small_icon;

/**
 地图图标
 */
@property (nonatomic,strong) NSString *map_icon;

/**
 子分类数据
 */
@property (nonatomic,strong) NSArray *subcategories;


@end
