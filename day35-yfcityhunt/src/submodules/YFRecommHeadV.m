

//
//  YFRecommHeadV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFRecommHeadV.h"

@interface  YFRecommHeadV ()
@property (nonatomic,strong)UIImageView *icon;



@end

@implementation YFRecommHeadV

-(void)initUI{
    self.icon=[[UIImageView alloc] initWithFrame:(CGRect){17,25,35,35}];
    self.icon.image=img(@"myicon");
    [self addSubview:self.icon];
    self.name=[[UILabel alloc] init];
    [self addSubview:self.name];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(5);
        make.centerY.equalTo(self.icon);
    }];
    self.logo=[[UIImageView alloc] init];
    [self addSubview:self.logo];
    self.logo.image=img(@"EXPRoleLogo");
    [self.logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name.mas_right).offset(5);
        make.centerY.equalTo(self.name);
        make.width.equalTo(@40);
        make.height.equalTo(@19);
    }];
    self.title=[[UILabel alloc] init];
    self.title.font=[UIFont boldSystemFontOfSize:20];
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@17);
        make.bottom.equalTo(@-15);
    
    }];
    
    self.browsecount=[[UILabel alloc] init];
    self.browsecount.textColor=[UIColor lightGrayColor];
    [self addSubview:self.browsecount];
    [self.browsecount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.name);
        make.right.equalTo(@-20);
        
    }];
    
    UIImageView *countiv=[[UIImageView alloc] initWithImage:img(@"articleList_readIcon")];
    [self addSubview:countiv];
    [countiv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.name);
        make.right.equalTo(self.browsecount.mas_left).offset(1);
        make.width.equalTo(@17);
        make.height.equalTo(@17);
    }];
    
    
    self.name.textColor=iGolbalGreen;
    self.icon.layer.masksToBounds=YES;
    self.icon.layer.cornerRadius=self.icon.w*.5;
 
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}

@end
