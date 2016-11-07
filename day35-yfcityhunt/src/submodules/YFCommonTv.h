//
//  YFCommonTv.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFCommonTv : UITableView<UITableViewDelegate,UITableViewDataSource>


-(void)initUI;
@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,strong)Class mclz;
@property (nonatomic,weak)UIViewController *vc;
-(void)appendDatas:(NSArray *)datas;
@end
