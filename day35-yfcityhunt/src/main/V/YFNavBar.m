//
//  YFNavBar.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFNavBar.h"

@interface YFNavBar ()

@end

@implementation YFNavBar

-(void)onBtnClicked:(UIButton *)sender{
    self.onClick(sender==_share);
}

-(void)initUI{
    self.bg=[[UIView alloc] initWithFrame:(CGRect){0,0,iScreenW,64}];
    self.bg.backgroundColor=iGolbalGreen;
    self.bg.alpha=0;
    [self addSubview:self.bg];
    
    self.back=[[UIButton alloc] initWithFrame:(CGRect){5,30,25,25}];
    [self.back setImage:img(@"back") forState:UIControlStateNormal];
    [self addSubview:self.back];
    [self.back addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.share=[[UIButton alloc] initWithFrame:(CGRect){iScreenW-36,34,26,17}];
    [self.share setImage:img(@"btn_share_normal") forState:UIControlStateNormal];
    [self.share addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.share];
    
    self.title=[[UILabel alloc] initWithFrame:(CGRect){30,32,iScreenW-85,25}];
    self.title.textAlignment=NSTextAlignmentLeft;
    self.title.font=[UIFont systemFontOfSize:19];
    self.title.textColor=[UIColor whiteColor];
    [self addSubview:self.title];
    
    self.iv=[[UIImageView alloc] initWithImage:img(@"index_navigation_nearby")];
    self.iv.frame=(CGRect){30,60,14,18};
    [self addSubview:self.iv];
    
    self.subti=[[UILabel alloc] initWithFrame:(CGRect){52,60,iScreenW-180,20}];
    self.subti.textAlignment=NSTextAlignmentLeft;
    self.subti.textColor=[UIColor whiteColor];
    self.subti.font=[UIFont systemFontOfSize:16];
    [self addSubview:self.subti];
    
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    self.title.text=dict[@"title"];
    self.subti.text=dict[@"subti"];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}

@end
