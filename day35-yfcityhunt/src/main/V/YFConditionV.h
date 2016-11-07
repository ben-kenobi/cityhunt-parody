//
//  YFConditionV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NoHLBtn,YFConditionV;


typedef NS_ENUM(NSInteger, ConditionBT){
    ConditionBTClassify= 0 ,
    ConditionBTArea= 1 ,
    ConditionBTSort= 2 ,
    ConditionBTMap= 3 ,
    ConditionBTList= 4
};

@protocol YFConditionVDele <NSObject>
-(void)cv:(YFConditionV *)cv onBtnClidkFrom:(ConditionBT)from to:(ConditionBT)to;
-(void)mapClick:(YFConditionV *)cv;
-(void)listClick:(YFConditionV *)cv;
-(void)cancelClick:(YFConditionV *)cv;

@end


@interface YFConditionV : UIView

@property (nonatomic,weak)id<YFConditionVDele>dele;
-(void)delSelectBtns;

@end
