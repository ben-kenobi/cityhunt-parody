//
//  YFSearchHisCell.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFSearchHisCell : UITableViewCell
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UIButton *del;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,strong)void(^onDel)(NSString *name);
+(instancetype)cellWithTv:(UITableView *)tv m:(NSString *)name;
@end
