//
//  YFSelCityV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/14.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSelCityV.h"
#import "YFLeftMenu.h"
@interface YFSelCityV()
@property (nonatomic,strong)NSMutableArray *btns;

@property (nonatomic,assign)UIButton * btn;

@end


@implementation YFSelCityV
-(instancetype)initWithTopBtn:(UIButton *)btn{
    if(self=[super initWithFrame:btn.frame]){
        _btn=btn;
        self.alpha=0;
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=btn.layer.cornerRadius;
        self.backgroundColor=btn.backgroundColor;
    }
    return self;
}




-(void)setNames:(NSMutableArray *)names{
    _names =[NSMutableArray arrayWithArray:names];
    self.h=self.h*_names.count;
    
    
    [self.btns enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    [self.btns removeAllObjects];
    
    for(int i=1;i<self.names.count;i++){
       UIView *line= [[UIView alloc] initWithFrame:(CGRect){self.w*.15,i*_btn.h,self.w*.7,1}];
        [line setBackgroundColor:[UIColor whiteColor]];
        line.alpha=.3;
      
        
        UIButton *btn=[NoHLBtn buttonWithType:0];
        [self.btns addObject:btn];
        btn.frame=(CGRect){0,_btn.h*i,self.w,_btn.h};
        [btn setBackgroundColor:self.backgroundColor];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
          [self addSubview:line];
    }
}

-(void)updateUI{
    NSString *title=[self.btn titleForState:UIControlStateNormal];
    for(NSInteger i=0;i<_names.count;i++){
        if([_names[i] isEqualToString:title]){
            [_names exchangeObjectAtIndex:0 withObjectAtIndex:i];
            break;
        }
    }
    for(int i=1;i<self.names.count;i++){
        [self.btns[i-1] setTitle:_names[i] forState:UIControlStateNormal];
    }
}
-(void)toggle:(BOOL)show{
    if(show){
        [self updateUI];
        [UIView animateWithDuration:.3 animations:^{
            self.alpha=.75;
        }];
    }else{
        [UIView animateWithDuration:.3 animations:^{
            self.alpha=0;
        }];
    }
}
-(void)btnClick:(UIButton *)sender{
    if(self.onchange)
        self.onchange([sender titleForState:UIControlStateNormal]);
}

iLazy4Ary(btns, _btns)


@end
