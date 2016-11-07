//
//  YFInfoDetailVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFInfoDetailVC.h"
#import "YFUserInfoV.h"

@interface YFInfoDetailVC ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *sv;
@property (nonatomic,strong)YFUserInfoV *infov;
@end

@implementation YFInfoDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.sv=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.sv.showsHorizontalScrollIndicator=NO;
    self.sv.showsVerticalScrollIndicator=NO;
    self.sv.alwaysBounceVertical=YES;
    self.sv.delegate=self;
    [self.view addSubview:self.sv];
    
    
    self.infov=[[YFUserInfoV alloc] initWithFrame:self.view.bounds];
    [self.sv addSubview:self.infov];

    
    self.sv.contentSize=(CGSize){0,self.infov.h};
    
    UILabel *lab=[[UILabel alloc] initWithFrame:(CGRect){0,30,iScreenW,34}];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.textColor=[UIColor whiteColor];
    lab.text=@"App Name";
    lab.font=[UIFont systemFontOfSize:21];
    [self.view addSubview:lab];
    
    UIButton *back=[[UIButton alloc] initWithFrame:(CGRect){10,30,30,30}];
    [back setImage:img(@"back") forState:UIControlStateNormal];
    [back addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.infov scrollOffsetY:scrollView.contentOffset.y];
}






@end
