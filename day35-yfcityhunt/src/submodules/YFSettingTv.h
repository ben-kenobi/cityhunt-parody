//
//  YFSettingTv.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFSettingTv :UITableView

@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,weak)UIViewController *vc;
-(void)appendDatas:(NSArray *)datas;
@end
