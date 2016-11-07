//
//  YFSettingCell2.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFSettingCell2 : UITableViewCell
@property (nonatomic,strong)UIButton *icon;
@property (nonatomic,strong)UIImageView *riv;
@property (nonatomic,strong)UILabel *rlab;



+(instancetype)cellWithTv:(UITableView *)tv dict:(NSDictionary *)dict;
@property (nonatomic,strong)NSDictionary *dict;
@end
