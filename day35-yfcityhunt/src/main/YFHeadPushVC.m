


//
//  YFHeadPushVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHeadPushVC.h"
#import "YFConditionV.h"
#import "YFHomeM.h"
#import "YFCustNavV.h"
#import "YFUnLoginView.h"

@interface YFHeadPushVC ()
@property (nonatomic,weak)YFCustNavV *nav;
@end

@implementation YFHeadPushVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.tv.backgroundColor=iColor(51, 52, 53, 1);
    self.tv.frame=(CGRect){0,64,iScreenW,iScreenH-64};
    self.conditionV.y+=64;
    
    YFCustNavV *nav=[[YFCustNavV alloc] initWithFrame:(CGRect){0,0,iScreenW,64}];
    self.nav=nav;
    self.nav.m=self.m;
    [self.nav setOnBtnClick:^(NSInteger flag) {
        if(!flag){
            [[[YFUnLoginView alloc] init] showToView:self.view];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    [self.view addSubview:self.nav];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
 
}


@end
