//
//  YFMessageVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFMessageVC.h"
#import "YFMessageTV.h"
#import "UIBarButtonItem+Ex.h"
#import "YFMesRefreshHv.h"
#import "MJRefresh.h"
#import "YFMessageM.h"
#import "YFMesPushVC.h"
@interface YFMessageVC ()
@property (nonatomic,strong)YFMessageTV *tv;
@property (nonatomic,strong)UIButton *rbtn;
@property (nonatomic,strong)UIButton *footer;
@property (nonatomic,strong)UIView *nobg;
@end

@implementation YFMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    __weak typeof (self)ws=self;
    
    self.tv=[[YFMessageTV alloc] initWithFrame:(CGRect){0,0,self.view.w,self.view.h-64} style:UITableViewStylePlain];
    self.tv.separatorStyle=0;
    self.tv.contentInset=(UIEdgeInsets){20,0,0,0};
    [self.view addSubview:self.tv];
    self.tv.rowHeight=UITableViewAutomaticDimension ;
    self.tv.estimatedRowHeight=100;
    [self.tv setBackgroundColor:self.view.backgroundColor];
    [self.tv setOnDel:^(YFMessageM *m,NSInteger flag) {
        if(flag==0){
            NSIndexPath *idx =[NSIndexPath indexPathForItem:[ws.tv.datas indexOfObject:m] inSection:0];
            [ws.tv.datas removeObject:m];
            [ws.tv deleteRowsAtIndexPaths:@[idx] withRowAnimation:0];
            [ws updateUI];
        }else if(flag==1) {
            YFMesPushVC *vc=[[YFMesPushVC alloc] init];
           vc.title= m.mesTopic;
            [ws.navigationController showViewController:vc sender:0];
        }
    }];
    
    YFMesRefreshHv *head=[YFMesRefreshHv headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(0, 1e9), dispatch_get_main_queue(), ^{
            [self.tv reloadData];
            [self.tv.header endRefreshing];
        });
    }];
    head.lastUpdatedTimeLabel.hidden=YES;
    head.stateLabel.hidden=YES;
    self.tv.header=head;
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem initWithTitle:@"编辑" titleColor:[UIColor whiteColor] target:self action:@selector(onItemClicked:)];
   self.rbtn= self.navigationItem.rightBarButtonItem.customView;
    
    [self loadMore];
}
-(void)onItemClicked:(id)sender{
    if(sender==self.footer){
        [self.tv.datas removeAllObjects];
        [self.tv reloadData];
        [self updateUI];
    }else if(sender==self.rbtn){
        self.tv.edit=!self.tv.edit;
        [self.rbtn setTitle:self.tv.edit?@"取消":@"编辑" forState:UIControlStateNormal] ;
        [self footer:self.tv.edit];
    }
}

-(void)updateUI{
    self.nobg.hidden=self.tv.datas.count;
    self.rbtn.hidden=!self.tv.datas.count;
    if(!self.tv.datas.count&&self.tv.edit){
        [self onItemClicked:self.rbtn];
    }
}
-(void)loadMore{
    [self.tv appendDatas:iRes4ary(@"MessageData.plist")];
}

-(UIButton *)footer:(BOOL)show{
    if(!_footer){
        _footer=[[UIButton alloc] initWithFrame:(CGRect){0,self.view.h,iScreenW,60}];
        [self.view addSubview:_footer];
        [_footer setTitle:@"清除全部消息" forState:UIControlStateNormal];
        [_footer setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_footer setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_footer setBackgroundColor:iGolbalGreen];
        [_footer addTarget:self action:@selector(onItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view bringSubviewToFront:_footer];
    [UIView animateWithDuration:.3 animations:^{
        _footer.y=show?self.view.h-60:self.view.h;
    }];
    
    return _footer;
}



-(UIView *)nobg{
    if(!_nobg){
        self.nobg=[[UIView alloc] initWithFrame:self.tv.bounds];
        [self.view addSubview:self.nobg];
        UIImageView *bgiv=[[UIImageView alloc] initWithImage:img(@"discoverlist_getNilData")];
        bgiv.center=(CGPoint){self.nobg.icx,self.nobg.icy-30};
        UILabel *bglab=[[UILabel alloc] initWithFrame:(CGRect){0,bgiv.b+20,self.nobg.w,35}];
        [bglab setTextAlignment:NSTextAlignmentCenter];
        [bglab setFont:iBFont(25)];
        [bglab setTextColor:[UIColor lightGrayColor]];
        [bglab setText:@"没有消息"];
        [self.nobg addSubview:bgiv];
        [self.nobg addSubview:bglab];
        self.nobg.hidden=YES;
    }
    return _nobg;
}

@end
