
//
//  YFUserInfoV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFUserInfoV.h"

@interface YFUserInfoV ()
@property (nonatomic,strong)UIView *top;
@property (nonatomic,strong)UIImageView *bigicon;
@property (nonatomic,strong)UIView *cover;

@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UILabel *desc;
@property (nonatomic,strong)UILabel *city;
@property (nonatomic,strong)UILabel *area;

@property (nonatomic,strong)UIImageView *gender;
@property (nonatomic,strong)UIButton *collect;
@property (nonatomic,strong)UIButton *been;

@end

@implementation YFUserInfoV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self initUI];
        [self postInit];
    }
    return self;
}

-(void)postInit{
      UIVisualEffectView *ev=[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]]  ;
        ev.frame=self.bigicon.bounds;
        ev.contentView.backgroundColor=iGolbalGreen;
        ev.contentView.alpha=.2;
        UIImageView *bluriv=[[UIImageView alloc] initWithFrame:self.bigicon.bounds];
        bluriv.image=self.bigicon.image;
        [self.top addSubview:bluriv];
        [bluriv addSubview:ev];
        bluriv.alpha=.5;
    
    
}

-(void)initUI{
    self.top=[[UIView alloc] initWithFrame:(CGRect){0,-80,self.w,400}];
    [self.top setBackgroundColor:[UIColor whiteColor]];
    self.bigicon=[[UIImageView alloc] initWithFrame:(CGRect){0,0,self.w,300}];
    self.bigicon.image=img(@"myicon");
    [self.top addSubview:self.bigicon];
    [self addSubview:self.top];
    self.cover=[[UIView alloc] initWithFrame:self.top.bounds];
    [self.top addSubview:self.cover];
    self.cover.alpha=.5;
    self.cover.backgroundColor=iGolbalGreen;
    
    UIView *bg=[[UIView alloc] initWithFrame:(CGRect){0,160,self.w,self.h-160}];
    [bg setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:bg];
    
    self.icon=[[UIImageView alloc] initWithFrame:(CGRect){0,-50,100,100}];
    [bg addSubview:self.icon];
    self.icon.image=img(@"myicon");
    self.icon.cx=self.icx;
    self.icon.layer.cornerRadius=self.icon.w*.5;
    self.icon.layer.masksToBounds=YES;
    self.icon.layer.borderWidth=4;
    self.icon.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    UILabel *(^newlab)(UIColor *,NSString *,UIFont *)=^(UIColor *color,NSString *str,UIFont *font){
        UILabel *lab=[[UILabel alloc] init];
        [lab setTextColor:color];
        lab.text=str;
        [lab setFont:font];
        [bg addSubview:lab];
        [lab setTextAlignment:NSTextAlignmentCenter];
        [lab setNumberOfLines:0];
        return lab;
    };
    self.name=newlab([UIColor blackColor],@"Auhtor Name",[UIFont boldSystemFontOfSize:20]);
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.icon.mas_bottom).offset(10);
    }];
    
    UIImageView *logo=[[UIImageView alloc] initWithImage:img(@"EXPRoleLogo")];
    [bg addSubview:logo];
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name.mas_bottom).offset(10);
        make.centerX.equalTo(@0);
        make.width.equalTo(@70);
        make.height.equalTo(@25);
    }];
    
    self.desc=newlab([UIColor grayColor],@"kwlejfwjfkjweiofjweifjweoikljfkljkflwejklfjwkeljfklwejfklwejklffwefwefwefwefwefwefewfewfwfwfwfwfwfwfwfjieowjf",[UIFont systemFontOfSize:20]);
    [self.desc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@18);
        make.right.equalTo(@-18);
        make.top.equalTo(logo.mas_bottom).offset(15);
    }];
    
    self.city=newlab([UIColor lightGrayColor],@"城市",[UIFont systemFontOfSize:20]);
    self.area=newlab([UIColor lightGrayColor],@"区域",[UIFont systemFontOfSize:20]);
    [self.area mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.desc.mas_bottom).offset(15);
    }];
    [self.city mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.area.mas_left).offset(-8);
        make.centerY.equalTo(self.area);
    }];
    
    self.gender=[[UIImageView alloc] init];
    [bg addSubview:self.gender];
    [self.gender mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.city);
        make.left.equalTo(self.area.mas_right).offset(18);
        make.height.with.equalTo(@20);
    }];
    self.gender.image=img(@"gender");
    
    
    
    self.collect =[[UIButton alloc] init];
    [bg addSubview:self.collect];
    [self.collect setImage:img(@"beenimage") forState:UIControlStateNormal];
    self.been=[[UIButton alloc] init];
    [bg addSubview:self.been];
    [self.been setImage:img(@"collect") forState:UIControlStateNormal];
    [self.collect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@55);
        make.width.equalTo(@230);
        make.centerX.equalTo(@0);
        make.top.equalTo(self.city.mas_bottom).offset(20);
    }];
    [self.been mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.centerX.equalTo(self.collect);
        make.top.equalTo(self.collect.mas_bottom).offset(30);
    }];
    
    self.collect.layer.masksToBounds=YES;
    self.been.layer.masksToBounds=YES;
    self.collect.layer.cornerRadius=5;
    self.been.layer.cornerRadius=5;
}

-(void)scrollOffsetY:(CGFloat)y{
    CGAffineTransform tran=CGAffineTransformMakeScale(1, 1);
    if(y<-60){
       CGFloat scale= (-60-y)/150.0+1;
        tran=CGAffineTransformMakeScale(scale, scale);
    }
    
    self.top.transform=CGAffineTransformTranslate(tran,0, .4*y);
    
    
}



@end
