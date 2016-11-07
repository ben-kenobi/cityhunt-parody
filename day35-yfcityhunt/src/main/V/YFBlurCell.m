
//
//  YFBlurCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFBlurCell.h"
#import "YFFoundCellM.h"
@interface YFBlurCell ()
@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)UILabel *lab;
@end

@implementation YFBlurCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.btn=[[UIButton alloc] init];
        [self addSubview:self.btn];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@60);
            make.top.equalTo(@5);
            make.centerX.equalTo(@0);
        }];
        
        self.lab=[[UILabel alloc] init];
        [self addSubview:self.lab];
        [self.lab setTextColor:[UIColor whiteColor]];
        [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@-5);
            make.centerX.equalTo(@0);
        }];
    }
    return self;
}

-(void)setM:(YFFoundCellM *)m{
    _m=m;
    [self.btn setImage:img(m.icon) forState:UIControlStateNormal];
    [self.lab setText:m.title];
}


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if(!self.userInteractionEnabled||self.hidden||self.alpha<=.01)
        return 0;
    if(![self pointInside:point withEvent:event]) return 0;
    return self;
}
@end
