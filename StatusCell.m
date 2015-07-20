
//
//  StatusCell.m
//  SinaDemo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "StatusCell.h"
#import "Status.h"
#import "StatusFrame.h"
#define  FONTSIZE 14
@interface StatusCell()
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameView;
@property (nonatomic,weak) UIImageView *vipView;
@property (nonatomic,weak) UILabel *textView;
@property (nonatomic,weak) UIImageView *picView;
@end
@implementation StatusCell

+ (id)statusCellWithTableView:(UITableView *)tableView {
    static NSString * cellID = @"statusCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 创建 iconView
        UIImageView *iconView = [[UIImageView alloc] init];
        // 把控件添加到cell的内容视图上
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        // 创建昵称label
        UILabel *nameView = [[UILabel alloc] init];
        [self.contentView addSubview:nameView];
        nameView.font = [UIFont systemFontOfSize:FONTSIZE];
        self.nameView = nameView;
        // 创建vip ImageView
        UIImageView *vipView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        // 创建 微博内容label
        UILabel *textView = [[UILabel alloc] init];
        [self.contentView addSubview:textView];
        self.textView = textView;
        textView.numberOfLines =0;
        textView.font = [UIFont systemFontOfSize:FONTSIZE];
        
        // 创建显示图片的imageView
        UIImageView *picView = [[UIImageView alloc] init];
        [self.contentView addSubview:picView];
        self.picView = picView;
        
    }
    return  self;
}

- (void)setStatusFrame:(StatusFrame *)statusFrame {
    _statusFrame = statusFrame;
    
    [self setData:statusFrame];
    [self setSubviewFrame:statusFrame];
}

- (void)setData:(StatusFrame *)statusFrame {
    self.iconView.image = [UIImage imageNamed:statusFrame.status.icon];
    self.nameView.text = statusFrame.status.name;
    self.vipView.image = [UIImage imageNamed:@"vip"];
    self.textView.text =statusFrame.status.text;
    self.picView.image = [UIImage imageNamed:statusFrame.status.picture];
}


- (void)setSubviewFrame:(StatusFrame *)statusFrame {
 
    
    self.iconView.frame = statusFrame.iconFrame;
    

    self.nameView.frame =statusFrame.nameFrame;
    
    
    self.vipView.frame = statusFrame.vipFrame;
    
   
    self.textView.frame = statusFrame.textFrame;
    

    self.picView.frame = statusFrame.pictureFrame;
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
