//
//  YFBlurV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFBlurV : UIImageView

@property(nonatomic,copy)void (^onClick)(NSString *title);
-(void)hide;

@end
