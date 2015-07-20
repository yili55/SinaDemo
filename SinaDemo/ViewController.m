//
//  ViewController.m
//  SinaDemo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"
#import "StatusCell.h"
#import "StatusFrame.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
// 1 加载数据
@property (nonatomic,strong) NSArray *status;
@property (nonatomic,strong) NSArray *statusFrame;

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@end

@implementation ViewController
// 懒加载 方式 创建数组
- (NSArray *)status {
    if (_status == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        // 保存 解析之后的数据模型
        NSMutableArray *objs = [NSMutableArray array];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dic in array) {
            Status *status = [Status statusWithDic:dic];
            [objs addObject:status];
        }
        _status =objs;
        
    }
    return _status;
}

- (NSArray *)statusFrame {
    if (_statusFrame == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        // 保存 解析之后的数据模型
        NSMutableArray *objs = [NSMutableArray array];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dic in array) {
            Status *status = [Status statusWithDic:dic];
            StatusFrame *statusFrame = [[StatusFrame alloc] init];
            statusFrame.status = status;
            [objs addObject:statusFrame];
        }
        _statusFrame =objs;
    }
    return _statusFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.contentTableView.rowHeight = 200;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark tableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusFrame *statusFrame = self.statusFrame[indexPath.row];
    return statusFrame.cellHeight;
}
#pragma mark tableViewDatasource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StatusCell *cell = [StatusCell statusCellWithTableView:tableView];
    StatusFrame *statusFrame = self.statusFrame[indexPath.row];
    cell.statusFrame = statusFrame;
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
