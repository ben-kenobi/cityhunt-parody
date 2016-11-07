//
//  YFMesRefreshHv.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFMesRefreshHv.h"

@implementation YFMesRefreshHv

-(void)prepare{
    [super prepare];
    [self setImages:[self imgsFrom:1 to:50 fms:@"loading-gray_0%02zd"] duration:1.5 forState:MJRefreshStateIdle];
    [self setImages:[self imgsFrom:50 to:50 fms:@"loading-gray_0%02zd"] duration:1.5 forState:MJRefreshStatePulling];
    [self setImages:[self imgsFrom:50 to:75 fms:@"loading-gray_0%02zd"] duration:1.5 forState:MJRefreshStateRefreshing];
}


-(NSMutableArray *)imgsFrom:(NSInteger)from to:(NSInteger)to fms:(NSString *)fms{
    NSMutableArray *imgs=[NSMutableArray array];
    for(NSInteger i=from;i<=to;i++){
        [imgs addObject:[img(iFormatStr(fms,i)) scaleImg2size:(CGSize){40,40}]];
    }
    return imgs;
}



@end
