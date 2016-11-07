//
//  YFHomeHeader.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/15.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeHeader.h"
#import "YFHomeM.h"

@interface YFHomeHeader ()
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *subti;
@end

@implementation YFHomeHeader


-(void)initUI{
    self.contentView.backgroundColor=iColor(56, 121, 255, 1);
    self.title=[[UILabel alloc] init];
    self.title.textColor=[UIColor whiteColor];
    self.title.text=@"title";
    self.title.font=[UIFont boldSystemFontOfSize:20];
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.leading.equalTo(@8);
    }];
    UIImageView *iv=[[UIImageView alloc] initWithImage:img(@"taoge")];
    [self addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.trailing.equalTo(@15);
    }];
    
    self.subti=[[UILabel alloc] init];
    self.subti.text=@"subtitle";
    [self addSubview:self.subti];
    [self.subti mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.trailing.equalTo(iv.mas_leading).offset(10);
    }];
    self.subti.textColor=[UIColor whiteColor];
    self.subti.font=[UIFont systemFontOfSize:14];
    
    
    
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithReuseIdentifier:reuseIdentifier]){
        [self initUI];
    }
    return self;
}

-(void)setM:(YFHomeM *)m{
    _m=m;
    self.title.text=m.tag_name;
    self.subti.text=m.section_count;
    self.contentView.backgroundColor=[UIColor colorWithHex:m.color];
}

@end
