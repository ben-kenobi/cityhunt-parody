//
//  YFMainVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/13.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFMainVC.h"
#import "YFNavVC.h"
#import "YFVC.h"
#import "YFLeftMenu.h"



@interface YFMainVC ()<UIGestureRecognizerDelegate>
@property (nonatomic,weak)YFVC *curVC;
@property (nonatomic,strong)YFLeftMenu *menu;
@end

@implementation YFMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bg=[[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.image=img(@"bgImage");
    [self.view  addSubview:bg];
    
    NSArray *clzes=@[@"YFHomeVC",@"YFFoundVC",@"YFUserVC",
                     @"YFHomeVC",@"YFHomeVC",@"YFMessageVC",
                     @"YFSettingVC"];
    for(NSString *clz in clzes){
        YFNavVC *nav=[[YFNavVC alloc] initWithRootViewController:[[NSClassFromString(clz) alloc] init]];
        nav.view.layer.shadowColor=[[UIColor blackColor]CGColor];
        nav.view.layer.shadowOffset=(CGSize){-3.5,0};
        nav.view.layer.shadowOpacity=.2;
        [self addChildViewController:nav];
    }
    
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan2:)];
    pan.delegate=self;
    [self.view addGestureRecognizer:pan];
    
    
    self.menu=[[YFLeftMenu alloc] init];
    __weak typeof(self) ws=self;
    [self.menu setOnClick:^(LeftButtonType from, LeftButtonType to) {
        if(to==LeftButtonTypeSina||to==LeftButtonTypeWeixin){
            return ;
        }
        YFNavVC *nav=ws.childViewControllers[to];
        if(to==LeftButtonTypeIcon){
            nav=self.childViewControllers[from];
        }
        YFNavVC *old= ws.childViewControllers[from];
        [old.view removeFromSuperview];
        [ws.view addSubview:nav.view];
        nav.view.transform=old.view.transform ;
        ws.curVC=nav.childViewControllers[0];
        [ws.curVC setOnCoverRm:^{
            [ws.menu onCoverRm];
        }];
        [ws.curVC coverClick];
        
        
    }];
    [self.view insertSubview:self.menu atIndex:1];
    [self.menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@40);
        make.bottom.equalTo(@-20);
        make.width.equalTo(self.view).multipliedBy(.8);
        
    }];
}

-(void)onPan2:(UIPanGestureRecognizer *)pan{
    UIView *view=self.curVC.navigationController.view;
    static CGFloat scale;
    static CGFloat maxx;
    static CGAffineTransform dest;
    static CGAffineTransform dest2;
    static long l=0;
    dispatch_once(&l, ^{
        scale=(iScreenH-ScaleTopMargin*2)/iScreenH;
        maxx=iScreenW*.83;
        dest=CGAffineTransformTranslate(CGAffineTransformMakeScale(scale, scale), (maxx-(iScreenW*(1-scale)*.5))/scale, 0);
        dest2=CGAffineTransformTranslate(CGAffineTransformMakeScale(scale, scale), (maxx+5-(iScreenW*(1-scale)*.5))/scale, 0);
    }) ;
    
    static CGFloat lastx=0;
    if(pan.state==UIGestureRecognizerStateBegan)
        lastx=0;
    CGFloat x=[pan translationInView:self.view].x;
    CGFloat delta=x-lastx;
    lastx=x;
    
    CGFloat nowx=view.x+delta;
    if(nowx<=0)
        view.transform=CGAffineTransformIdentity;
    else if(nowx>=maxx+5){
       view.transform=dest2;
    }else{
        CGFloat xyscale=1-(nowx/maxx*(1-scale));
        view.transform=CGAffineTransformTranslate(CGAffineTransformMakeScale(xyscale, xyscale),(nowx-(iScreenW*(1-xyscale)*.5))/xyscale, 0);
        
    }

    if(pan.state==UIGestureRecognizerStateEnded){
        CGFloat totaldura=.5;
        CGFloat rest=maxx-nowx;
        if(rest<0) rest=-rest;
        CGFloat dura=rest/maxx*totaldura;
        if(nowx>maxx*.5){
//            if(dura<.1)dura=.1;
            [UIView animateWithDuration:dura delay:0 usingSpringWithDamping:.7 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                view.transform=dest;
            } completion:^(BOOL finished) {
                [self.curVC setIsScale:YES];
                [self.curVC leftClick];
            }];
        }else{
            dura=totaldura-dura;
//            if(dura<.1) dura=.1;
            [UIView animateWithDuration:dura delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                view.transform=CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                self.curVC.isScale=NO;
                [self.curVC coverClick];
            }];
        }
    }

}

-(void)onPan:(UIPanGestureRecognizer *)pan{
    
    UIView *view=self.curVC.navigationController.view;
    CGFloat mox=[pan translationInView:self.view].x;
    CGFloat scale=(iScreenH-ScaleTopMargin*2)/iScreenH;
    CGFloat maxx=iScreenW-iScreenW*ScaleRight;
    if(!self.curVC.isScale){
        if(mox<=maxx+5&&mox>=0){
            CGFloat scalexy=1-mox/maxx*(1-scale);
            view.transform=CGAffineTransformTranslate(CGAffineTransformMakeScale(scalexy, scalexy), mox/scalexy, 0);
        }
        if(pan.state==UIGestureRecognizerStateEnded){
            if(mox>=maxx/2){
                CGFloat rest=maxx-mox;
                CGFloat dura=rest>0?rest/maxx*.5:rest/maxx*-.5;
                if(dura<.1)dura=.1;
                
                
                [UIView animateWithDuration:dura delay:0 usingSpringWithDamping:.5 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    view.transform=CGAffineTransformTranslate(CGAffineTransformMakeScale(scale, scale), maxx, 0);
                } completion:^(BOOL finished) {
                    [self.curVC setIsScale:YES];
                    [self.curVC leftClick];

                }];
        
            }else{
                
                [UIView animateWithDuration:.2 animations:^{
                    view.transform=CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    self.curVC.isScale=NO;
                }];
            }
        }
    }else{
        CGFloat scalexy=scale-mox/maxx*(1-scale);

        if(mox<=5){
            view.transform=CGAffineTransformTranslate(CGAffineTransformMakeScale(scalexy, scalexy), (mox+maxx), 0);
        }
        if(pan.state==UIGestureRecognizerStateEnded){
            if(-mox>=maxx*.5){
                CGFloat rest=maxx+mox;
                CGFloat dura=rest>0?.5*rest/maxx:-.5*rest/maxx;
                if(dura<.1) dura=.1;
                [UIView animateWithDuration:dura delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    view.transform=CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    [self.curVC setIsScale:NO];
                    [self.curVC coverClick];
                }];
                
            }else{
                [UIView animateWithDuration:.2 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:.5 options:UIViewAnimationOptionOverrideInheritedOptions animations:^{
                     view.transform=CGAffineTransformTranslate(CGAffineTransformMakeScale(scale, scale), maxx, 0);
                } completion:^(BOOL finished) {
                    self.curVC.isScale=YES;
                }];
              
            }
        }
        
    }
}








@end
