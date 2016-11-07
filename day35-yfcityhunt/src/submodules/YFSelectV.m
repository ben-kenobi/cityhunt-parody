
//
//  YFSelectV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSelectV.h"

@interface YFSelectV ()

@property (nonatomic,strong)UIView *line;
@property (nonatomic,weak)YFSElectBtn *cur;
@property (nonatomic,strong)NSMutableArray *btns;
@end

@implementation YFSelectV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.backgroundColor=[UIColor whiteColor];
    self.layer.shadowOpacity=.1;
    self.layer.shadowOffset=(CGSize){0,2};
    
    YFSElectBtn *(^newb)(UIImage *,NSInteger,CGRect)=^(UIImage *img,NSInteger tag,CGRect frame){
        YFSElectBtn *b=[[YFSElectBtn alloc]initWithFrame:frame];
        b.tag=tag;
        [b setImage:img forState:UIControlStateNormal];
        [self addSubview:b];
        [self setBackgroundColor:[UIColor whiteColor]];
        [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchDown];
        return b;
    };
    
    int btnCount=2;
    
    CGFloat btnw=self.w*.3, margin=(self.w-btnw*btnCount)/(btnCount+1);
    [self.btns addObject: newb(img(@"groom"),0,(CGRect){margin,0,btnw,self.h})];
    [self.btns addObject:newb(img(@"info"),1,(CGRect){2*margin+btnw,0,btnw,self.h})];
    
    self.line=[[UIView alloc] initWithFrame:(CGRect){margin,self.h-4,btnw,4}];
    self.line.backgroundColor=iGolbalGreen;
    self.line.layer.masksToBounds=YES;
    self.line.layer.cornerRadius=2;
    [self addSubview:self.line];

}

-(void)onBtnClicked:(YFSElectBtn *)sender{
    if(self.cur==sender) return ;
    self.onchange(self.cur.tag,sender.tag);
    [UIView animateWithDuration:.3 animations:^{
        self.line.x=sender.x;
    }];
    self.cur=sender;
}
-(void)setOnchange:(void (^)(NSInteger, NSInteger))onchange{
    _onchange=onchange;
    [self onBtnClicked:self.btns[0]];
}

-(void)lineToIdx:(NSInteger)idx{
    if(idx>=0&&idx<self.btns.count)
        [self onBtnClicked:self.btns[idx]];
}

iLazy4Ary(btns, _btns)
@end




@implementation YFSElectBtn
-(void)setHighlighted:(BOOL)highlighted{};

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.imageView.contentMode=UIViewContentModeCenter;
    }
    return self;
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    return (CGRect){contentRect.origin.x+2,contentRect.origin.y+2,contentRect.size.width-4,contentRect.size.height-4};
}


@end