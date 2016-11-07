//
//  YFMessageTV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFCommonTv.h"
@class YFMessageM;

@interface YFMessageTV : YFCommonTv
@property (nonatomic,assign)BOOL edit;
@property (nonatomic,strong)void(^onDel)(YFMessageM *m,NSInteger flag);

@end
