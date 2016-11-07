
//
//  YFPromptV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFPromptV.h"
#import "YFLeftMenu.h"
@interface YFPromptV ()
@property (nonatomic,weak)UIImageView *icon;
@property (nonatomic,weak)UILabel *title;
@property (nonatomic,weak)UIButton *btn;
@end

@implementation YFPromptV

-(void)initUI{
    [self setBackgroundColor:iColor(14, 121, 254, 1)];
    UILabel *title=[[UILabel alloc] init];
    title.text=@"coming  soon....";
    self.title=title;
    title.font=[UIFont boldSystemFontOfSize:20];
    title.textColor=[UIColor lightGrayColor];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-15);
        make.centerX.equalTo(@0);
        make.height.equalTo(@24);
    }];
    
    
    UIImageView *icon=[[UIImageView alloc] init];
    self.icon=icon;
    [self addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@13);
        make.bottom.equalTo(title.mas_top).offset(-10);
        make.width.equalTo(icon.mas_height);
    }];

    UIButton *btn=[[UIButton alloc] init];
    [btn setImage:img(@"searchList_btn_delete_6P") forState:UIControlStateNormal];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.width.equalTo(@23);
    }];
    [btn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    self.layer.cornerRadius=10;
    self.layer.shadowOffset=(CGSize){4,4};
    self.layer.shadowOpacity=.5;
    self.layer.shadowColor=[[UIColor blackColor]CGColor];
    NSMutableArray *mary=[NSMutableArray array];
    for(int i=1;i<=95;i++){
        [mary addObject:img(iFormatStr(@"loading_0%02zd",i))];
    }
    self.icon.animationImages=mary;
    self.icon.animationDuration=4;
    self.icon.animationRepeatCount=0;
    [self.icon startAnimating];

}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.icon.layer.masksToBounds=YES;
    self.icon.layer.cornerRadius=self.icon.h*.5;

}
-(void)hide{
    [UIView animateWithDuration:.3 animations:^{
        self.alpha=0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)showToView:(UIView *)sup{
    self.cx=sup.icx;
    self.y=120;
    self.alpha=0;
    [sup addSubview:self];
   
    [UIView animateWithDuration:.4 animations:^{
        self.alpha=1;
    }];
  
}

@end
