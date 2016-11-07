//
//  YFDetailFooterV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFDetailFooterV : UIView

@property (nonatomic,weak)UILabel *title;

@property (nonatomic,copy)void (^onClick)(NSInteger idx);

@end
