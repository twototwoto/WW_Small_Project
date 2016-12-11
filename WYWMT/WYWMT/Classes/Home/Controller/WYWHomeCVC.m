//
//  WYWHomeCVC.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/9.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "WYWHomeCVC.h"
#import "WYWHomeNavView.h"
#import "WYWCategoryVC.h"

@interface WYWHomeCVC ()

@end

@implementation WYWHomeCVC

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    self = [super init];
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    if (self) {
        self.collectionView.backgroundColor = WYWColor(213, 213, 213, 1);
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setupNav];
    
}





#pragma mark - 设置关于导航的内容
#warning - 注意这个设置导航栏上的rightBarButtonItem的操作需要在这个主控器来设置
- (void)setupNav{
    
    
    UIBarButtonItem *mapItem = [UIBarButtonItem barBuutonItemWithTarget:self action:@selector(clickMapItem) icon:@"icon_map" highlighticon:@"icon_map_highlighted"];
    
    UIBarButtonItem *searchItem = [UIBarButtonItem barBuutonItemWithTarget:self action:@selector(clickSearchItem) icon:@"icon_search" highlighticon:@"icon_search_highlighted"];
    
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
    
    //处理左部分的barButtonItem
    //注意：上边的这种方式创建出来的logoItem有点暗暗的感觉
//    UIBarButtonItem *logoItem = [UIBarButtonItem barBuutonItemWithTarget:nil action:nil icon:@"icon_meituan_logo" highlighticon:nil];
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStylePlain target:self action:nil];
    //设置禁用
    logoItem.enabled = NO;
    
    //设置中间的item
    WYWHomeNavView *categoryView = [WYWHomeNavView homeNavView];
    categoryView.iconHighLightedName = @"icon_category_highlighted_-1";
    categoryView.iconName = @"icon_category_-1";
    categoryView.title = @"全部分类";
    categoryView.subTitle = nil;
    //给categoryView添加事件处理
    [categoryView addTarget:self action:@selector(clickCategoryItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc]initWithCustomView:categoryView];
    self.navigationItem.leftBarButtonItems = @[logoItem,categoryItem];
    
    //设置地区
    WYWHomeNavView *districtView = [WYWHomeNavView homeNavView];
    districtView.iconHighLightedName = @"icon_district_highlighted";
    districtView.iconName = @"icon_district";
    districtView.title = @"北京-全部";
    districtView.subTitle = nil;
    UIBarButtonItem *districtItem = [[UIBarButtonItem alloc]initWithCustomView:districtView];
    self.navigationItem.leftBarButtonItems = @[logoItem,categoryItem,districtItem];
    
    //设置排序  默认排序
    WYWHomeNavView *sortView = [WYWHomeNavView homeNavView];
    sortView.iconHighLightedName = @"icon_sort_highlighted";
    sortView.iconName = @"icon_sort";
    sortView.title = @"排序";
    sortView.subTitle = @"默认排序";
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc]initWithCustomView:sortView];
    self.navigationItem.leftBarButtonItems = @[logoItem,categoryItem,districtItem,sortItem];

    
}
#pragma mark - 分类item的点击方法
- (void)clickCategoryItem{
    NSLog(@"点击了分类item");
    
    WYWCategoryVC *categoryVc = [[WYWCategoryVC alloc]init];
    //设置modal类型 UIModalPresentationPopover
    categoryVc.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popover =  categoryVc.popoverPresentationController;
    //设置barButtonItem
    popover.barButtonItem = self.navigationItem.leftBarButtonItems[1];
    //设置popover的大小
    //WWAnnotation:当我们仅仅是在SB中设置好了popover的相应的视图之后的话还是存在问题的，我们需要进一步处理弹出来的控制器的大小
//    categoryVc.preferredContentSize = CGSizeMake(350, 350);
    
    /**WWAnnotation:还有一点需要注意的是单单设置这里是起不到我们想要的结果的，因为这个里边的值的话需要做的处理是这个值的话popoverView此时还没有值，它的大小需要在更下边一行的代码出现了的时候才能知道，所以应该在给popoverView懒加载处理一下。
    下边的代码将会先到popoverView的懒加载，
     */
    categoryVc.preferredContentSize = CGSizeMake(categoryVc.popoverView.size.width, categoryVc.popoverView.size.height);
    [self presentViewController:categoryVc animated:YES completion:nil];
    
}
#pragma mark - 点击地图的item
-(void)clickMapItem{
    WYWLog(@"点击了地图的按钮");
}

#pragma mark - 搜索框的方法实现
- (void)clickSearchItem{
    WYWLog(@"点击了搜索框");

}




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
