//
//  YFMesCell.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YFMessageM;
@interface YFMesCell : UITableViewCell

@property(nonatomic,strong)YFMessageM *m;
+(instancetype)cellWithTv:(UITableView*)tv m:(YFMessageM *)m edit:(BOOL)edit;

@property (nonatomic,strong)void(^onDel)(YFMessageM *m,NSInteger flag);

@end
