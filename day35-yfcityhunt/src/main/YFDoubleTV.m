//
//  YFDoubleTV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFDoubleTV.h"

@interface YFDoubleTV ()
@property (nonatomic,weak)UILabel *title;
@property (nonatomic,weak)UILabel *subti;

@end

@implementation YFDoubleTV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UILabel *(^newlab)(UIFont *)=^(UIFont *font){
            UILabel *lab=[[UILabel alloc] init];
            lab.textColor=[UIColor whiteColor];
            lab.font=font;
            [self addSubview:lab];
            return lab;
        };
        self.title=newlab([UIFont boldSystemFontOfSize:16]);
        self.subti=newlab([UIFont systemFontOfSize:13]);
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.top.equalTo(@2);
        }];
        [self.subti mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.top.equalTo(self.title.mas_bottom);
        }];
    }
    return self;
}

-(void)setTitle:(NSString *)title subti:(NSString *)subti{
    self.title.text=title;
    self.subti.text=subti;
}


@end
