//
//  YFSearchTv.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFCommonTv.h"

@interface YFSearchTv : YFCommonTv
@property (nonatomic,copy)void (^onTouch)();

-(void)onSearch:(NSString *)str;
@end
