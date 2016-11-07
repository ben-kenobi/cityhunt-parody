//
//  YFShowVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFShowVC.h"
#import "YFHomeCellM.h"
#import "UIBarButtonItem+Ex.h"
#import "YFHomeCell.h"
#import "YFConditionV.h"
#import "YFRefreshHeader.h"
#import "YFBlurV.h"
#import "YFMapVC.h"
#import "YFDetailVC.h"

@interface YFShowVC ()<UITableViewDataSource,UITableViewDelegate,YFConditionVDele>

@end

@implementation YFShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self.navigationController  action:@selector(popViewControllerAnimated:) img:img(@"back") hlimg:0 frame:(CGRect){0,0,25,25}];
    
    self.tv=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tv.delegate=self;
    self.tv.dataSource=self;
    self.tv.separatorStyle=0;
    self.tv.rowHeight=210;
    [self.view addSubview:self.tv];
    
    self.conditionV=[[YFConditionV alloc] initWithFrame:(CGRect){iScreenW*.05,10,iScreenW*.9,iScreenW*.9*.13}];
    [self.view addSubview:self.conditionV];
    self.conditionV.dele=self;
    
    
    YFRefreshHeader *header=[YFRefreshHeader headerWithRefreshingBlock:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.datas removeAllObjects];
                [self.tv reloadData];
            });
            [NSThread sleepForTimeInterval:.1];
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self loadDatas];
                [self.tv reloadData];
                [self.tv.header endRefreshing];
            });
        });
    }];
    header.lastUpdatedTimeLabel.hidden=YES;
    header.stateLabel.hidden=YES;
    [header beginRefreshing];
    self.tv.header=header;
    
    self.mapvc=[[YFMapVC alloc] init];
    [self addChildViewController:self.mapvc];
    
    [self loadDatas];
}

#pragma mark-
#pragma mark tableViewDele
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController  showViewController:[[YFDetailVC alloc]init] sender:0];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YFHomeCellM *m=self.datas[indexPath.row];
    return [YFHomeCell cellWithTv:tableView m:m];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [UIView animateWithDuration:.2 animations:^{
         self.conditionV.alpha=scrollView.contentOffset.y>=-25;
       
    }];
    
}


#pragma mark-
#pragma mark YFConditionVDele
-(void)cv:(YFConditionV *)cv onBtnClidkFrom:(ConditionBT)from to:(ConditionBT)to{
    if(!self.blurv){
        self.blurv=[[YFBlurV alloc]initWithFrame:self.tv.frame];
        self.blurv.image=[UIImage imgFromV:self.tv];
        __weak typeof(self)ws=self;
        [self.blurv setOnClick:^(NSString *str) {
            ws.blurv=0;
            [ws.conditionV delSelectBtns];
            if(str){
                [ws.tv.header beginRefreshing];
            }
        }];
        
        [self.view insertSubview:self.blurv belowSubview:self.conditionV];
        [UIView animateWithDuration:.3 animations:^{
            self.blurv.alpha=1;
        }];
    }
}
-(void)mapClick:(YFConditionV *)cv{
    [self.blurv hide];
    self.blurv=0;
    self.mapvc.view.alpha=0;
    [self.view insertSubview:self.mapvc.view belowSubview:self.conditionV];
    [UIView animateWithDuration:.3 animations:^{
        self.mapvc.view.alpha=1;
    }];
    
    
}
-(void)listClick:(YFConditionV *)cv{
    [UIView animateWithDuration:.3 animations:^{
        self.mapvc.view.alpha=0;
    } completion:^(BOOL finished) {
        [self.mapvc.view removeFromSuperview];
    }];
}
-(void)cancelClick:(YFConditionV *)cv{
    [self.blurv hide];
    self.blurv=0;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:img(@"recomend_btn_gone") forBarMetrics:0];
}

-(void)loadDatas{
    self.conditionV.alpha=0;
    [self appendDatas:iRes4ary(@"CellDatas.plist")];
}
-(void)appendDatas:(NSArray *)datas{
    for(NSDictionary *dict in datas){
        [self.datas addObject:[YFHomeCellM setDict:dict]];
    }
}
iLazy4Ary(datas, _datas)
@end
