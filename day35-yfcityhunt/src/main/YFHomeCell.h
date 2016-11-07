//
//  YFHomeCell.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YFHomeCellM;
@interface YFHomeCell : UITableViewCell
@property (nonatomic,strong)YFHomeCellM *m;
+(instancetype)cellWithTv:(UITableView *)tv m:(YFHomeCellM *)m;
@end
