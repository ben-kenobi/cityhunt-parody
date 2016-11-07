//
//  YFFoundVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFFoundVC.h"
#import "YFFoundCV.h"

@interface YFFoundVC ()
@property (nonatomic,strong)YFFoundCV *cv;



@end

@implementation YFFoundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
-(void)initUI{
    self.navigationItem.title=@"发现";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.cv=[[YFFoundCV alloc] initWithFrame:(CGRect){0,0,self.view.w,self.view.h-64}];
    [self.view addSubview:self.cv];
    self.cv.vc=self;
    [self loadDatas];
}



-(void)loadDatas{
    [self.cv appendDatas:iRes4ary(@"foundData.plist") ];
}


@end
