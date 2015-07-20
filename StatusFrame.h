//
//  StatusFrame.h
//  SinaDemo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Status;
@interface StatusFrame : NSObject

@property (nonatomic,assign) CGRect iconFrame;
@property (nonatomic,assign) CGRect nameFrame;
@property (nonatomic,assign) CGRect vipFrame;
@property (nonatomic,assign) CGRect textFrame;
@property (nonatomic,assign) CGRect pictureFrame;
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,strong) Status *status;

@end
