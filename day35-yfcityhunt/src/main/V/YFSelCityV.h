//
//  YFSelCityV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/14.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoHLBtn,CityBtn;
@interface YFSelCityV : UIView
@property (nonatomic,strong)void(^onchange)(NSString *name);
@property (nonatomic,strong)NSMutableArray *names;
-(instancetype)initWithTopBtn:(UIButton *)btn;
-(void)toggle:(BOOL)show;
@end
