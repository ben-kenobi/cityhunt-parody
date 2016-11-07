//
//  YFRefreshHeader.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFRefreshHeader.h"

@implementation YFRefreshHeader

-(void)prepare{
    [super prepare];
    
    NSMutableArray *idleimgs=[NSMutableArray array];
    for(NSInteger i=1;i<=50;i++){
        [idleimgs addObject:[img(iFormatStr(@"loading_0%02zd",i)) scaleImg2size:(CGSize){40,40}]];
    }
    [self setImages:idleimgs forState:MJRefreshStateIdle];
    
    NSMutableArray *refreshimgs=[NSMutableArray array];
    for(NSInteger i=50;i<=75;i++)
        [refreshimgs addObject:[img(iFormatStr(@"loading_0%02zd",i)) scaleImg2size:(CGSize){40,40}]];
    [self setImages:refreshimgs forState:MJRefreshStatePulling];
    
    NSMutableArray *startimgs=[NSMutableArray array];
    for(NSInteger i=75;i<=95;i++){
        [startimgs addObject:[img(iFormatStr(@"loading_0%02zd",i)) scaleImg2size:(CGSize){40,40}]];
    }
    [self setImages:startimgs forState:MJRefreshStateRefreshing];
}


@end
