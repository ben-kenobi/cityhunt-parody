//
//  YFNavBar.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFNavBar : UIView
@property (nonatomic,copy)void(^onClick)(NSInteger idx);
@property (nonatomic,strong)NSDictionary *dict;
@property (nonatomic,strong)UIView *bg;
@property (nonatomic,strong)UIButton *back;
@property (nonatomic,strong)UIButton *share;
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UIImageView *iv;
@property (nonatomic,strong)UILabel *subti;
@end
