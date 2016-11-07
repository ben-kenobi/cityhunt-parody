//
//  YFCustNavV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YFHomeM,YFDoubleTV;
@interface YFCustNavV : UIView

@property (nonatomic,weak)UIButton *back;
@property (nonatomic,weak)UIButton *share;
@property (nonatomic,strong)YFDoubleTV *title;


@property (nonatomic,strong)YFHomeM *m;
@property (nonatomic,strong)void (^onBtnClick)(NSInteger flag);

@end
