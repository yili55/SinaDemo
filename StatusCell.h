//
//  StatusCell.h
//  SinaDemo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Status;
@class StatusFrame;
@interface StatusCell : UITableViewCell
@property (nonatomic,strong) Status *status;
@property (nonatomic,strong) StatusFrame * statusFrame;
+ (id)statusCellWithTableView:(UITableView *)tableView;
@end
