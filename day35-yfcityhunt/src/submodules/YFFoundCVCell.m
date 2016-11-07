//
//  YFFoundCVCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFFoundCVCell.h"
#import "YFFoundM.h"

@interface YFFoundCVCell()
@property (nonatomic,strong)UIButton *icon;
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *sub;

@end

@implementation YFFoundCVCell

-(void)setM:(YFFoundM *)m{
    _m=m;
    [self.icon setImage:img(_m.icon) forState:UIControlStateNormal];
    self.title.text=m.title;
    self.sub.text=m.subTitle;
}

-(void)onBtnClicked:(UIButton *)sender{
    if(self.onClick)
        self.onClick(_m);
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if(self.userInteractionEnabled==NO||self.hidden==YES||self.alpha<=.01)
        return 0;
    if([self pointInside:point withEvent:event])
        return self.icon;
    return 0;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.icon=[[UIButton alloc] initWithFrame:(CGRect){(self.w-70)*.5,0,70,70}];
        self.title=[[UILabel alloc] initWithFrame:(CGRect){0,83,self.w,20}];
        self.sub=[[UILabel alloc] initWithFrame:(CGRect){0,self.title.b,self.w,self.h-self.title.b}];
        [self.title setTextAlignment:NSTextAlignmentCenter];
        [self.sub setTextAlignment:NSTextAlignmentCenter];
        [self.sub setTextColor:[UIColor grayColor]];
        [self.sub setFont:[UIFont systemFontOfSize:16]];
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.sub];
        [self.icon addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
@end
