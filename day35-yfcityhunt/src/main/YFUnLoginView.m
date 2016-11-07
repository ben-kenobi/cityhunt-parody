//
//  YFUnLoginView.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFUnLoginView.h"
#import "YFPromptV.h"

static const CGFloat vHeight=250;
static const CGFloat dura=.3;

@interface YFUnLoginView ()

@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak)UIButton *sina;
@property (nonatomic,weak)UIButton *wechat;
@property (nonatomic,strong)UIButton *cover;
@property (nonatomic,weak)UIView *sup;
@property (nonatomic,weak)YFPromptV *prompt;

@end

@implementation YFUnLoginView


-(void)initUI{
    [self setBackgroundColor:[UIColor whiteColor]];
    UIImageView *icon=[[UIImageView alloc] initWithImage:img(@"unLogin-1")];
    self.icon=icon;
    [self addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.width.height.equalTo(@40);
        make.top.equalTo(@18);
    }];
    icon.layer.masksToBounds=YES;
    icon.layer.cornerRadius=20;
    
    UILabel *lab=[[UILabel alloc] init];
    lab.text=@"未登陆";
    [self addSubview:lab];
    [lab setFont:[UIFont boldSystemFontOfSize:17]];
    [lab setTextColor:[UIColor lightGrayColor]];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).offset(10);
        make.centerX.equalTo(@0);
    }];
    
    UIButton *(^newb)(UIImage *,UIImage *)=^(UIImage *img,UIImage *hl){
        UIButton *b=[[UIButton alloc] init];
        [b setImage:img forState:UIControlStateNormal];
        [b setImage:hl forState:UIControlStateHighlighted];
        [self addSubview:b];
        [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        return b;
    };
    self.sina=newb(img(@"button_login_sina"),img(@"button_login_sina_clicked"));
    self.wechat=newb(img(@"button_login_wechat"),img(@"button_login_wechat_clicked"));
    
    [self.sina mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(lab.mas_bottom).offset(10);
        make.width.equalTo(@263);
        make.height.equalTo(@52);
    }];
    [self.wechat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.sina.mas_bottom).offset(20);
        make.height.width.equalTo(self.sina);
    }];
    
    
    
}

-(instancetype)init{
    if(self=[super initWithFrame:(CGRect){0,0,iScreenW,vHeight}]){
        [self initUI];
    }
    return self;
}

-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.cover){
        [UIView animateWithDuration:dura animations:^{
            self.y=_sup.h;
            self.cover.alpha=0;
        }completion:^(BOOL finished) {
            [self.cover removeFromSuperview];
            [self removeFromSuperview];
        }];
    }else if(sender==self.sina||sender==self.wechat){
        if(!self.prompt){
            YFPromptV *pro=[[YFPromptV alloc] initWithFrame:(CGRect){0,0,self.w*.6,130}];
            self.prompt=pro;
            [pro showToView:self.cover];
        }
    }
}
-(void)showToView:(UIView *)sup{
    _cover=[UIButton buttonWithType:0];
    [_cover setBackgroundColor:iColor(0, 0, 0, .3)];
    [_cover addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [sup addSubview:_cover];
    _cover.frame=sup.bounds;
    
    self.sup=sup;
    
    [sup addSubview:self];
    self.y=sup.h;
    [UIView animateWithDuration:dura animations:^{
        self.y=sup.h-self.h;
    }];
}



@end
