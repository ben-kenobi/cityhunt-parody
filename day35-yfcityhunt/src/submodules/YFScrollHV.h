//
//  YFScrollHV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface YFScrollHV : UIView
-(void)scroll:(CGRect)rect hvh:(CGFloat)h;

@property (nonatomic,strong)NSArray *imgs;
@property (nonatomic,strong)UIView *nav;
@end
