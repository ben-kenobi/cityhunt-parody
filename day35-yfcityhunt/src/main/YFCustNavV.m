//
//  YFCustNavV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCustNavV.h"
#import "YFHomeM.h"
#import "YFDoubleTV.h"

@interface YFCustNavV ()

@end

@implementation YFCustNavV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UIButton *(^newb)(UIImage *)=^(UIImage *img){
            UIButton *b=[[UIButton alloc] init];
            [b setImage:img forState:UIControlStateNormal];
            [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:b];
            return b;
        };
        self.back=newb(img(@"back"));
        self.share=newb(img(@"btn_share_normal"));
        self.title=[[YFDoubleTV alloc] init];
        [self addSubview:self.title];
        
        [self.back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@10);
            make.bottom.equalTo(@-12);
            make.height.width.equalTo(@25);
        }];
        [self.share mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-10);
            make.bottom.equalTo(@-15);
            make.height.equalTo(@18);
            make.width.equalTo(@24);
            
        }];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.bottom.equalTo(@0);
            make.width.equalTo(self);
            make.height.equalTo(@44);
        }];
        [self.title setUserInteractionEnabled:NO];
    }
    return self;
}



-(void)setM:(YFHomeM *)m{
    _m=m;
    self.backgroundColor=[UIColor colorWithHex:m.color];
    [self.title setTitle:m.tag_name subti:m.section_count];
}

-(void)onBtnClicked:(UIButton *)sender{
    self.onBtnClick(sender==self.back);
}



@end
