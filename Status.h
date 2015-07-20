//
//  Status.h
//  SinaDemo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject
@property (nonatomic,copy) NSString * picture;
@property (nonatomic,copy) NSString * text;
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) BOOL vip;

+ (id)statusWithDic:(NSDictionary *)dic;
@end
