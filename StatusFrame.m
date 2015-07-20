//
//  StatusFrame.m
//  SinaDemo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "StatusFrame.h"
#import "Status.h"
@implementation StatusFrame
- (void)setStatus:(Status *)status {
    // 保存status数据
    _status = status;
    // 间隔的距离
    CGFloat padding = 10;
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconH = 50;
    CGFloat iconW = 50;
    
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + padding;
    CGFloat nameH = 14;
    // name高度居中 nameY = (iconH - nameH )*0.5
    CGFloat nameY = (iconH - nameH) *0.5  + padding;
    // 传入字体
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont systemFontOfSize:14]
                          };
    // 计算文字的尺寸
    CGSize size = [self calcuString:status.name sizeWithSize:CGSizeMake(150, 0) andDic:dic];;
    // 文字的宽度
    CGFloat nameW = size.width;
    self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    CGFloat vipX = CGRectGetMaxX(self.nameFrame) +padding;
    CGFloat vipY = nameY;
    self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    
    if (status.vip == NO) {
        self.vipFrame = CGRectZero;
    }
    CGFloat textX = padding;
    CGFloat textY = CGRectGetMaxY(self.iconFrame) + padding;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat textW = screenWidth - 2*padding;
    CGFloat textH = [self calcuString:status.text sizeWithSize:CGSizeMake(screenWidth - 2 *padding, MAXFLOAT) andDic:dic].height;
    self.textFrame = CGRectMake(textX, textY, textW, textH);
    CGFloat picW = 100;
    CGFloat picH = 100;
    CGFloat picX = padding;
    CGFloat picY = CGRectGetMaxY(self.textFrame) + padding;
    self.pictureFrame = CGRectMake(picX, picY, picW, picH);
    if (status.picture == nil) {
        self.pictureFrame = CGRectMake(picX, picY, 0, 0);
    }
    self.cellHeight = CGRectGetMaxY(self.pictureFrame) +padding;
    
    
}

- (CGSize)calcuString:(NSString *)string sizeWithSize:(CGSize)size andDic:(NSDictionary *)dic {
    
    // 计算文字的尺寸
    CGSize textSize = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return textSize;
}

@end
