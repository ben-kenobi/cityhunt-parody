//
//  YFInfoCell.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YFInfoM;
@interface YFInfoCell : UITableViewCell
@property (nonatomic,strong)YFInfoM *m;
+(instancetype)cellWithTv:(UITableView *)tv m:(YFInfoM *)m;
@property (nonatomic,weak)UIImageView *rightiv;
@property (nonatomic,weak)UIView *line;
@end
