//
//  WYWDistrictVC.m
//  WYWMT
//
//  Created by 王永旺永旺 on 2016/12/12.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "WYWDistrictVC.h"

static NSString *leftCell = @"leftCell";
static NSString *rightCell = @"rightCell";

@interface WYWDistrictVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *topView;

/**
 选中当前的一级菜单的索引
 */
@property (nonatomic,assign)NSInteger currentIndex;
@end

@implementation WYWDistrictVC


/**
 返回使用Xib的方式创建出来的对象 这里故意使用xib和类名不同名的方式

 @return 返回使用Xib的方式创建出来的对象
 */
- (instancetype)init
{
    self = [super initWithNibName:@"View" bundle:nil];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (WYWPopoverView *)popoverView{
    if(_popoverView == nil){
        _popoverView = [WYWPopoverView popoverView];
        [self.view addSubview:_popoverView];
        //设置位置
//        _popoverView.y = self.topView.height;
//        // FIXME: 不知道为什么打印出来的topView.height的高度是1000,,,,,,,,
//        NSLog(@"%f",self.topView.height);
        
        _popoverView.y = 40;
        //设置数据源
        _popoverView.leftTable.delegate = self;
        _popoverView.leftTable.dataSource = self;
        _popoverView.rightTable.delegate = self;
        _popoverView.rightTable.dataSource = self;
        
    }
    return _popoverView;
}

#pragma mark - UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.popoverView.leftTable){
        //记录选中的行
        self.currentIndex = indexPath.row;
        //刷新二级菜单
        [self.popoverView.rightTable reloadData];
    }else{//二级菜单
        //获取数据
        WYWLog(@"%@",self.districts[self.currentIndex].subdistricts[indexPath.row]);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(tableView == self.popoverView.leftTable){//一级菜单
        return self.districts.count;
        
    }else{//二级菜单
        NSLog(@"%zd",self.districts[self.currentIndex].subdistricts.count);
        return self.districts[self.currentIndex].subdistricts.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if(tableView == self.popoverView.leftTable){
        cell = [tableView dequeueReusableCellWithIdentifier:leftCell];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftCell];
            //设置分割线
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
            cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
        }
        cell.textLabel.text = self.districts[indexPath.row].name;
        //设置箭头
        if(self.districts[indexPath.row].subdistricts){
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
        
        else{
            cell.accessoryType = UITableViewCellAccessoryNone;
    
        }
    }else{//二级菜单
        cell = [tableView dequeueReusableCellWithIdentifier:rightCell];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rightCell];
            //设置分割线
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
            cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
        }
        cell.textLabel.text = self.districts[_currentIndex].subdistricts[indexPath.row];
        
    }
    return cell;
}



@end
