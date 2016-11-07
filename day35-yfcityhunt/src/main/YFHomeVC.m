//
//  YFHomeVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/13.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeVC.h"
#import "YFHomeM.h"
#import "YFHomeHeader.h"
#import "YFHomeCellM.h"
#import "YFHomeCell.h"
#import "YFHeadPushVC.h"
#import "YFDetailVC.h"

@interface YFHomeVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)UISegmentedControl *seg;
@property (nonatomic,strong)UITableView *tv;
@property (nonatomic,strong)UIImageView *nearIv;
@property (nonatomic,strong)NSMutableArray *datas;
@end

@implementation YFHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initUI];
}
-(void)initNav{
    UISegmentedControl *seg=[[UISegmentedControl alloc] initWithItems:@[@"推荐",@"附近"]];
    [seg setTintColor:iColor(26,163, 146, 1)];
    seg.frame=(CGRect){0,0,self.view.w*.5,30};
    [seg setSelectedSegmentIndex:0];
    [seg addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventValueChanged];
    self.seg=seg;
    NSDictionary *att=@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName:[UIColor whiteColor]};
    [seg setTitleTextAttributes:att forState:UIControlStateNormal];
    [seg setTitleTextAttributes:att forState:UIControlStateSelected];
    self.navigationItem.titleView=seg;
}
-(void)initUI{
    [self.view setBackgroundColor:iColor(51, 52, 53, 1)];
    UITableView *tv=[[UITableView alloc] initWithFrame:(CGRect){0,0,iScreenW,iScreenH-64} style:UITableViewStylePlain];
    tv.separatorStyle=0;
    self.tv=tv;
    tv.delegate=self;
    tv.dataSource=self;
    [self.view addSubview:tv];
    tv.backgroundColor=self.view.backgroundColor;
    self.nearIv=[[UIImageView alloc] initWithFrame:self.view.bounds];
    self.nearIv.image=img(@"wnxBG");
    [self loadDatas];
}

-(void)loadDatas{
    [self appendDatas:iRes4ary(@"HomeDatas.plist")];
}


-(void)appendDatas:(NSArray *)ary{
    for(NSDictionary *dict in ary){
        [self.datas addObject: [YFHomeM setDict:dict]];
    }
    [self.tv reloadData];
}

-(void)onBtnClicked:(id)sender{
    if(sender==self.seg){
        if( self.seg.selectedSegmentIndex==0){
            [self.view addSubview:self.tv];
            [self.nearIv removeFromSuperview];
        }else{
            [self.view addSubview:self.nearIv];
            [self.tv removeFromSuperview];
        }
    }
}

#pragma mark-
#pragma mark UITableViewDelegate N dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.datas[section] body] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *const iden=@"headeriden";
    YFHomeHeader *header=[tableView dequeueReusableHeaderFooterViewWithIdentifier:iden];
    if(!header){
        header=[[YFHomeHeader alloc] initWithReuseIdentifier:iden];
    }
    YFHomeM *m=self.datas[section];
    [header setM:m];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [header addGestureRecognizer:tap];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 210;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YFHomeM *m=self.datas[indexPath.section];
    YFHomeCellM *m2= [YFHomeCellM setDict:m.body[indexPath.row]];
    
    return [YFHomeCell cellWithTv:tableView m:m2];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController showViewController:[[YFDetailVC alloc]init] sender:0];
}





-(void)onTap:(UITapGestureRecognizer *)tap{
    YFHeadPushVC *vc=[[YFHeadPushVC alloc] init];
    vc.m=[(YFHomeHeader *)tap.view m];
    [self.navigationController showViewController:vc sender:0];
}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:img(@"recomend_btn_gone") forBarMetrics:0];
    [super viewWillAppear:animated];
}

iLazy4Ary(datas, _datas)

@end
