//
//  YFMesPushVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFMesPushVC.h"
#import "YFConditionV.h"
@interface YFMesPushVC ()

@end

@implementation YFMesPushVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=iColor(51, 52, 53, 1);
    BOOL found=self.title.length>2;
    if(!found){
        [self.tv removeFromSuperview];
        self.tv=nil;
        [self.conditionV removeFromSuperview];
        self.conditionV=0;
        
        UIImageView *iv=[[UIImageView alloc] initWithImage:img(@"EXP_getNilData_6P")];
        [self.view addSubview:iv];
        iv.center=(CGPoint){self.view.icx,self.view.icy-150};
        UILabel *lab=[[UILabel alloc] init];
        lab.font=iBFont(20);
        lab.text=@"Not found relative recommendataion";
        lab.textColor=[UIColor grayColor];
        [self.view addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.centerY.equalTo(iv.mas_bottom).offset(20);
        }];
    }

}



@end
