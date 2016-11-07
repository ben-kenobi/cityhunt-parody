//
//  YFSearchHotCell.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFSearchHotCell : UITableViewCell
@property (nonatomic,strong)NSArray *hots;

+(instancetype)cellWithTv:(UITableView *)tv m:(NSArray *)hots;
@property (nonatomic,strong)void (^onClick)(NSString *name);
@end
