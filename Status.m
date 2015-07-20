//
//  Status.m
//  SinaDemo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "Status.h"

@implementation Status
+ (id)statusWithDic:(NSDictionary *)dic {
    return  [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    if ( self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
