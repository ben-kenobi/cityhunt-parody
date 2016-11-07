//
//  YFNavVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/13.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFNavVC.h"

@interface YFNavVC ()<UIGestureRecognizerDelegate>

@end

@implementation YFNavVC



- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate=nil;
    self.interactivePopGestureRecognizer.enabled=NO;
    
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate   action:@selector(onPan:)];
    pan.delegate=self;
    [self.view addGestureRecognizer:pan];
}
+(void)initialize{
    UINavigationBar *bar=[UINavigationBar appearanceWhenContainedIn:self, nil];
    [bar setBackgroundImage:img(@"recomend_btn_gone") forBarMetrics:0];
    bar.translucent=NO;

    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return (self.topViewController!=[self.viewControllers firstObject]);
}

@end
