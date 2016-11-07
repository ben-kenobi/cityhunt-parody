//
//  YFShowVC.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YFConditionV,YFBlurV,YFMapVC;

@interface YFShowVC : UIViewController
@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,strong)UITableView *tv;
@property (nonatomic,strong)YFConditionV *conditionV;
@property (nonatomic,strong)YFBlurV *blurv;
@property (nonatomic,strong)YFMapVC *mapvc;
@end
