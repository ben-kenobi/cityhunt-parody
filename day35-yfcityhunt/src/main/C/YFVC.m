//
//  YFVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/13.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFVC.h"
#import "UIBarButtonItem+Ex.h"
#import "YFSearchVC.h"


#define Duration .3

@interface YFVC ()

@end

@implementation YFVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem initWithNormalImage:img(@"search_icon_white_6P@2x") target:self action:@selector(rightClick)];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem initWithNormalImage:img(@"artcleList_btn_info_6P") target:self action:@selector(leftClick)];
    self.view.backgroundColor=iColor(239, 239, 244, 1);
}

-(void)rightClick{
    [self.navigationController showViewController:[[YFSearchVC alloc] init] sender:0];
    
}
-(void)leftClick{
     [self.cover removeFromSuperview];
    _cover=[[UIButton alloc]initWithFrame:self.navigationController.view.bounds];
    [_cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:_cover];
    CGFloat scale=(iScreenH-ScaleTopMargin*2)/iScreenH;
    CGFloat movex=iScreenW-iScreenW*ScaleRight;
    
    [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        CGAffineTransform tran=CGAffineTransformMakeScale(scale, scale);
        self.navigationController.view.transform=CGAffineTransformTranslate(tran, movex, 0);
    } completion:^(BOOL finished) {
        self.isScale=YES;
    }];
    
}
-(void)coverClick{
    [UIView animateWithDuration:Duration animations:^{
        self.navigationController.view.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
        self.cover=nil;
        self.isScale=NO;
        if(self.onCoverRm)
            self.onCoverRm();
    }];
}


@end
