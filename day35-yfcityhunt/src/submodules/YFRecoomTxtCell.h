//
//  YFRecoomTxtCell.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YFRecommM;
@interface YFRecoomTxtCell : UITableViewCell
@property(nonatomic,strong)YFRecommM *m;
+(instancetype)cellWithTv:(UITableView *)tv m:(YFRecommM *)m;
@end
