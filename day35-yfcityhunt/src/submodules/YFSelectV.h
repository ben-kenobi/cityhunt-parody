//
//  YFSelectV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFSelectV : UIView
@property (nonatomic,assign)BOOL showComment;
@property (nonatomic,copy)void(^onchange)(NSInteger from,NSInteger to);
-(void)lineToIdx:(NSInteger)idx;



@end


@interface YFSElectBtn :UIButton


@end