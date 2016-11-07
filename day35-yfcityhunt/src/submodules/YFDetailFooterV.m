
//
//  YFDetailFooterV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/18.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFDetailFooterV.h"
#import "YFLeftMenu.h"
@interface YFDetailFooterV ()
@property (nonatomic,strong)NSMutableArray *btns;

@end

@implementation YFDetailFooterV

-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        UIView *v=[[UIView alloc] initWithFrame:(CGRect){20,10,self.w-40,1}];
        [self addSubview:v];
        [v setBackgroundColor:[UIColor lightGrayColor]];
        UILabel *lab=[[UILabel alloc] initWithFrame:(CGRect){10,26,self.w-20,25}];
        [lab setTextAlignment:NSTextAlignmentCenter];
        [lab setTextColor:[UIColor grayColor]];
        [self addSubview:lab];
        self.title=lab;
        lab.text=@"收藏者";
        CGFloat btnw=40;
        NoHLBtn *(^newb)(CGRect,NSString *,UIImage *)=^(CGRect frame,NSString *title,UIImage *img){
            NoHLBtn *b=[[NoHLBtn alloc] initWithFrame:frame];
            b.layer.masksToBounds=YES;
            b.layer.cornerRadius=btnw*.5;
            [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [b setBackgroundColor:iGolbalGreen];
            if(img){
               
                [b setImage:img forState:UIControlStateNormal];
            }else{
                [b setTitle:title forState:UIControlStateNormal];
            }
            [self addSubview:b];
            return b;
        };
        CGFloat margin=(self.w-6*btnw)/7;
        self.btns= [NSMutableArray array];
        NSMutableArray *imgs=[NSMutableArray array];
        for(int i=45;i<73;i++){
            [imgs addObject:img(iFormatStr(@"loading_0%02d",i))];
        }
        for(int i=0;i<5;i++){
            [self.btns addObject:newb((CGRect){(margin+btnw)*i+margin,lab.b+20,btnw,btnw},0,[UIImage animatedImageWithImages:imgs duration:2])];
        }
        [self.btns addObject:newb((CGRect){(margin+btnw)*5+margin,lab.b+20,btnw,btnw},@"123",0)];
        
    }
    return self;
}
-(void)onBtnClicked:(UIButton *)sender{
    self.onClick([self.btns indexOfObject:sender]);
}

@end
