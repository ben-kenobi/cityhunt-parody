//
//  YFSettingCell.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFSettingCell : UITableViewCell

+(instancetype)cellWithTv:(UITableView *)tv dict:(NSDictionary *)dict;
@property (nonatomic,strong)NSDictionary *dict;
@end
