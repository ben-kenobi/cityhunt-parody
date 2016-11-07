
//
//  YFFoundCVheadV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFFoundCVheadV.h"

@implementation YFFoundCVheadV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.title=[[UILabel alloc] init];
        self.title.textColor=[UIColor grayColor];
        self.title.font=[UIFont systemFontOfSize:20];
        self.title.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.title];
        
        self.line=[[UIView alloc] init];
        self.line.hidden=YES;
        self.line.backgroundColor=[UIColor lightGrayColor];
        self.line.alpha=.2;
        [self addSubview:self.line];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.title.frame=self.bounds;
    self.line.frame=(CGRect){40,0,self.w-80,1};
}
@end
