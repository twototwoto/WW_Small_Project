//
//  WYWCategoryVC.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/10.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "WYWCategoryVC.h"
#import "WYWCategoryModel.h"


//设置左右两边的TableViewCell的重用标识
static NSString *leftTableCell = @"leftTableCell";
static NSString *rightTableCell = @"rightTableCell";

@interface WYWCategoryVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray<WYWCategoryModel *> *categoryArr;
//选中的一级菜单的索引
@property (nonatomic,assign)NSInteger currentIndex;

@end

@implementation WYWCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [self.popoverView.leftTable registerClass:[UITableViewCell class] forCellReuseIdentifier:leftTableCell];
    [self.popoverView.rightTable registerClass:[UITableViewCell class] forCellReuseIdentifier:rightTableCell];
    
    //挪到下边的popOverView的懒加载
//    //添加下拉视图
//    WYWPopoverView *popover = [WYWPopoverView popoverView];
//    [self.view addSubview:popover];
//    self.popoverView = popover;
    /*
    下边的代码
    1.也是一种解决xib的布局的方案;但是不推荐因为这么设置了之后的话，self.view中的所有的子视图的Autoresizing都失效了                         self.view.autoresizesSubviews = NO;
     2.所以尽量还是选用在StoryBoard中去修改的方式    
     3.或者是选择使用 popoverView   popoverView. autoresizingMask = typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
//    UIViewAutoresizingNone                 = 0,
//    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
//    UIViewAutoresizingFlexibleWidth        = 1 << 1,
//    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
//    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
//    UIViewAutoresizingFlexibleHeight       = 1 << 4,
//    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
//};
    
*/
    
}

- (WYWPopoverView *)popoverView{
    if(_popoverView == nil){
        //添加下拉视图
        WYWPopoverView *popover = [WYWPopoverView popoverView];
        /*WWAnnotation:经过上边的代码之后就有了popoverView的大小了，
         之后下边的内容的话将会作出的处理是一走self.view就又会走到viewDidLoad了
         */
        [self.view addSubview:popover];
        popover.leftTable.dataSource = self;
        popover.leftTable.delegate = self;
        popover.rightTable.dataSource = self;
        popover.rightTable.delegate = self;
//        self.popoverView = popover;
//        self.popoverView.leftTable.dataSource = self;
//        self.popoverView.rightTable.dataSource = self;
        //从plist文件中取出来数据
        
        //plist文件转为数组
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"categories.plist" ofType:nil]];
        //字典转模型
        self.categoryArr = [NSArray yy_modelArrayWithClass:[WYWCategoryModel class] json:dictArr];
        
        _popoverView = popover;
        
//        NSLog(@"%@-%@-%@",self.categoryArr[0].name,self.categoryArr[1].icon,self.categoryArr[2].subcategories);
        
    }
        return _popoverView;
}

#pragma mark - UITableViewDelegate
//WWAnnotation:确定下来选中的是哪一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //一级菜单
    if(tableView == self.popoverView.leftTable){
        //记录选中的行
        _currentIndex = indexPath.row;
        //刷新二级菜单
        [self.popoverView.rightTable reloadData];
    }else{//二级菜单
        //获取数据
        NSLog(@"%@",self.categoryArr[self.currentIndex].subcategories[indexPath.row]);
    
    }

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(self.popoverView.leftTable == tableView){
        return self.categoryArr.count;
    }else{
        return self.categoryArr[_currentIndex].subcategories.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell;
//    if(tableView == self.popoverView.leftTable){
//        cell = [tableView dequeueReusableCellWithIdentifier:leftTableCell];
//    }else{
//        cell = [tableView dequeueReusableCellWithIdentifier:rightTableCell];
//    }
////    UITableViewCell *cell = [[UITableViewCell alloc]init];
//    
//    cell.textLabel.text = self.categoryArr[indexPath.row].name;

    /**
     注意如果用上边的方式注册cell是会奔溃的
     */
    /**
     WWAnnotation
        注意如果用上边的方式是会崩溃的
            因为注册cell的话是有三种方式，但是呢，这里用的xib里边放TableView
                这种情况下是无法使用SB注册cell的
            那么用代码注册cell的方式呢，也是无法去指定后期注册的cell的类型的
                所以呢需要选用的是iOS6之前的那种创建并且注册cell的方式来处理问题
     
     */
    UITableViewCell *cell;
    if(tableView == self.popoverView.leftTable)
    
    {
        cell = [tableView dequeueReusableCellWithIdentifier:leftTableCell];
        
        if(cell == nil){
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftTableCell];
//        cell.textLabel.text = self.categoryArr[indexPath.row].name;
        }
        //WWAnnotation: 注意下边的赋值一定要放对了位置，否则数据的显示就出问题了
        cell.textLabel.text = self.categoryArr[indexPath.row].name;
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:rightTableCell];
        if(cell == nil){
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rightTableCell];
            
//            cell.textLabel.text = self.categoryArr[_currentIndex].subcategories[indexPath.row];
        }
        //WWAnnotation: 注意下边的赋值一定要放对了位置，否则数据的显示就出问题了
        /**
         WWAnnotation
         如果放错了上边的代码的话将会出现的问题是只有在是新建出来的cell的时候的数据显示出来的才是正常的，对于其他的复用的cell都是重复地显示的新创建的cell
         */
        cell.textLabel.text = self.categoryArr[_currentIndex].subcategories[indexPath.row];
    }
    
    return cell;
}



@end
