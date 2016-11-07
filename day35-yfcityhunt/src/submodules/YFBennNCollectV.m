//
//  YFBennNCollectV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFBennNCollectV.h"
#import "YFLeftMenu.h"
#import "YFUnLoginView.h"

@interface YFBennNCollectV()
@property (nonatomic,strong)UIButton *been;
@property (nonatomic,strong)UIButton *collect;

@end

@implementation YFBennNCollectV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UIButton *(^newb)(UIImage *,CGRect)=^(UIImage *img,CGRect frame){
            UIButton *b=[[NoHLBtn alloc] initWithFrame:frame];
            [b setBackgroundImage:img forState:UIControlStateNormal];
            [self addSubview:b];
            [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            return b;
        };
        
        self.been=newb(img(@"collect"),(CGRect){0,0,self.w*.5,self.h});
        self.collect=newb(img(@"beenimage"),(CGRect){self.w*.5,0,self.w*.5,self.h});
    }
    return self;
}

-(void)onBtnClicked:(UIButton *)sender{
    [[[YFUnLoginView alloc] init] showToView:self.superview];
}




@end
