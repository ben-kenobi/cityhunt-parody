//
//  YFrecommTV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFrecommTV.h"
#import "YFDetailFooterV.h"
#import "YFRecommM.h"
#import "YFRecommPicCell.h"
#import "YFRecoomTxtCell.h"
#import "YFRecommHeadV.h"
#import "YFInfoDetailVC.h"
@interface YFCommonTv ()
@property (nonatomic,strong)YFDetailFooterV *footer;
@end

@implementation YFrecommTV



-(void)initUI{
    self.footer=[[YFDetailFooterV alloc] initWithFrame:(CGRect){0,0,iScreenW,200}];
    self.tableFooterView=self.footer;
    __weak typeof (self)ws=self;
    [self.footer setOnClick:^(NSInteger idx) {
        if(idx!=5){
            [ws.vc.navigationController showViewController:[[YFInfoDetailVC alloc] init] sender:0] ;
        }
    }];
    YFRecommHeadV *head= [[YFRecommHeadV alloc] initWithFrame:(CGRect){0,0,iScreenW,110}];
     self.tableHeaderView=head;
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [head addGestureRecognizer:tap];
    head.name.text=@"author name";
    head.title.text=@"w;lefklwe;kf;lwetitle";
    head.browsecount.text=@"浏览 10933";

    self.mclz=[YFRecommM class];
    [self setEstimatedRowHeight:106];
    [self setRowHeight:UITableViewAutomaticDimension];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YFRecommM *m=self.datas[indexPath.row];

    if(m.ch){
        return [YFRecoomTxtCell cellWithTv:tableView m:m];
    }else{
        return [YFRecommPicCell cellWithTv:tableView m:m];
    }
}

-(void)tap:( id)sender{
    if([sender isKindOfClass:[UITapGestureRecognizer class]]){
        [self.vc.navigationController showViewController:[[YFInfoDetailVC alloc] init] sender:0] ;
    }else{
        
    }
}

@end
