//
//  YFConditionV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFConditionV.h"
#import "YFLeftMenu.h"
static const CGFloat btnAlpha=.8;
@interface YFConditionV ()
@property (nonatomic,strong)NSArray *lines;

@property (nonatomic,strong)NSArray *btns;

@property (nonatomic,strong)UIView *botv;
@property (nonatomic,strong)NoHLBtn *listb;

@property (nonatomic,weak)UIButton *selb;
@end

@implementation YFConditionV
-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}
-(void)initUI{
    self.backgroundColor=[UIColor clearColor];
    self.layer.masksToBounds=YES;
    
    self.botv=[[UIView alloc] init];
    self.botv.backgroundColor=iColor(50, 50, 50, 1);
    self.botv.alpha=btnAlpha;
    [self addSubview:self.botv];
    
    self.listb=[NoHLBtn buttonWithType:0];
    self.listb.layer.masksToBounds=YES;
    [self.listb setTitle:@"列表" forState:UIControlStateNormal];
    self.listb.tag=4;
    [self.listb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.listb addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.listb setBackgroundColor:iColor(50, 50, 50, 1)];
    self.listb.alpha=0;
    [self addSubview:self.listb];
    
    NoHLBtn *(^newb)(NSString *,NSInteger)=^(NSString *title,NSInteger tag){
        NoHLBtn *b=[NoHLBtn buttonWithType:0];
        b.tag=tag;
        [b setTitle:title forState:UIControlStateNormal];
        [b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [b setBackgroundImage:img(@"selectBtn") forState:UIControlStateSelected];
        [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.botv addSubview:b];
        return b;
    };
    
    self.btns=@[newb(@"分类",0),newb(@"地区",1),newb(@"排序",2),newb(@"地图",3)];
    
    
    UIView *(^newv)()=^(){
        UIView *view=[[UIView alloc] init];
        view.backgroundColor=[UIColor grayColor];
        view.alpha=btnAlpha;
        [self.botv addSubview:view];
        return view;
    };
    self.lines=@[newv(),newv(),newv()];
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat radi=MIN(self.h, self.w)*.1;
    self.layer.cornerRadius=radi;
    self.listb.layer.cornerRadius=radi;
    
    self.botv.frame=self.bounds;
    CGFloat w=self.w/self.btns.count;
    for(int i=0;i<self.lines.count;i++){
        [self.btns[i] setFrame:(CGRect){i*w,0,w,self.h}];
        [self.lines[i] setFrame:(CGRect){(i+1)*w,self.h*.3,1,self.h*.4}];
    }
    [self.btns[self.btns.count-1] setFrame:(CGRect){(self.btns.count-1)*w,0,w,self.h}];
    self.listb.frame=[self.btns[self.btns.count-1] frame];
    
}

-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.btns[0]){
        [self.lines[0] setHidden:YES];
        [self.lines[1] setHidden:NO];
        [self.lines[2] setHidden:NO];
    }else if(sender==self.btns[1]){
        [self.lines[0] setHidden:YES];
        [self.lines[1] setHidden:YES];
        [self.lines[2] setHidden:NO];
    }else if(sender==self.btns[2]){
        [self.lines[0] setHidden:NO];
        [self.lines[1] setHidden:YES];
        [self.lines[2] setHidden:YES];
    }else if(sender==self.btns[3]){
        [self.lines[0] setHidden:NO];
        [self.lines[1] setHidden:NO];
        [self.lines[2] setHidden:NO];
    }
    
    if(sender!=self.btns[3]&&sender!=self.listb){
        if(self.selb!=sender){
            [self.dele cv:self onBtnClidkFrom:self.selb.tag to:sender.tag];
            self.selb.selected=NO;
            self.selb=sender;
            self.selb.selected=YES;
        }else{
            self.selb.selected=NO;
            [self showLine];
            self.selb=nil;
            [self.dele cancelClick:self];
        }
        
    }else if(sender==self.btns[3]){
        [self.dele mapClick:self];
        [self showLine];
        self.selb.selected=NO;
        self.selb=nil;
        [UIView animateWithDuration:.1 animations:^{
            self.botv.alpha=0;
            self.listb.alpha=btnAlpha;
        }];
    }else{
        [self.dele listClick:self];
        [UIView animateWithDuration:.1 animations:^{
            self.botv.alpha=btnAlpha;
            self.listb.alpha=0;
            [self showLine];
        }];
    }
}


-(void)delSelectBtns{
    self.selb.selected=NO;
    [self showLine];
}

-(void)showLine{
    [self.lines enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj setHidden:NO];
    }];
}



@end
