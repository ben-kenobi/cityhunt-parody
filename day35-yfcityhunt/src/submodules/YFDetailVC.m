

//
//  YFDetailVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFDetailVC.h"
#import "YFInfoTV.h"
#import "YFrecommTV.h"
#import "YFScrollHV.h"
#import "YFSelectV.h"
#import "YFNavBar.h"
#import "YFUnLoginView.h"
#import "YFBennNCollectV.h"
#import "YFDetailFooterV.h"
#import "YFDetailM.h"
#import "YFMapVC.h"
#import "YFInfoM.h"

static CGFloat const HeadH=200,SelVH=45;

@interface YFDetailVC ()<UIScrollViewDelegate,UITableViewDelegate,UIActionSheetDelegate>

@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,strong)UIScrollView *bgsv;
@property (nonatomic,strong)YFInfoTV *infotv;
@property (nonatomic,strong)YFrecommTV *recommtv;

@property (nonatomic,weak)UITableView *curtv;

@property (nonatomic,strong)YFScrollHV *topsv;
@property (nonatomic,strong)YFSelectV *selev;

@property (nonatomic,strong)YFNavBar *nav;
@property (nonatomic,strong)YFBennNCollectV *beenNcoll;


@property (nonatomic,assign)CGFloat scrolly;

@end

@implementation YFDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initNav];
}
-(void)initUI{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    self.bgsv=[[UIScrollView alloc] initWithFrame:iScreen.bounds];
    [self.view addSubview:self.bgsv];
    self.bgsv.backgroundColor=[UIColor whiteColor];
    self.bgsv.pagingEnabled=YES;
    self.bgsv.bounces=NO;
    self.bgsv.showsHorizontalScrollIndicator=NO;
    self.bgsv.delegate=self;
    self.bgsv.contentSize=(CGSize){iScreenW*2,0};
    
    
    
    self.recommtv=[[YFrecommTV alloc] initWithFrame:iScreen.bounds style:UITableViewStylePlain];
    self.recommtv.delegate=self;
    self.recommtv.contentInset=(UIEdgeInsets){HeadH+SelVH,0,0,0};
    self.recommtv.vc=self;
    [self.bgsv addSubview:self.recommtv];
   
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:iData4F(iRes(@"detailJson")) options:0 error:0][@"body"];
    YFDetailM *detailm=  [YFDetailM setDict:dict];
    [self.recommtv appendDatas:detailm.article_list[0][@"newcontent"]];
    
    
    
    self.infotv=[[YFInfoTV alloc] initWithFrame:(CGRect){iScreenW,0,iScreenW,iScreenH} style:UITableViewStylePlain];
     self.infotv.delegate=self;
    self.infotv.contentInset=(UIEdgeInsets){HeadH+SelVH,0,0,0}
    ;
    [self.infotv appendDatas:iRes4ary(@"infoDatas.plist")];
    self.infotv.vc=self;
    [self.bgsv addSubview:self.infotv];
    
    
    self.topsv=[[YFScrollHV alloc] initWithFrame:(CGRect){0,0,iScreenW,HeadH}];
    [self.topsv setImgs:@[@"http://img.chengmi.com/cm/3bc2198c-c909-4698-91b2-88e00c5dff2a",
                          @"http://img.chengmi.com/cm/dba3fb4d-b5ef-4218-b976-52cba4538381",
                          @"http://img.chengmi.com/cm/934ad87f-400c-452e-9427-12a03fe9cf6e"]];
    [self.view addSubview:self.topsv];
    
    
    self.selev=[[YFSelectV alloc] initWithFrame:(CGRect){0,self.topsv.b,iScreenW,SelVH}];
    __weak typeof(self)ws=self;
    [self.selev setOnchange:^(NSInteger from, NSInteger to) {
        if(to==0){
            ws.curtv=ws.recommtv;
        }else if(to==1){
            ws.curtv=ws.infotv;
        }
        CGFloat delta=(ws.bgsv.contentOffset.x/ws.bgsv.w)-(int)(ws.bgsv.contentOffset.x/ws.bgsv.w);
        if (delta<.1) {
            [UIView animateWithDuration:.3 animations:^{
                [ws.bgsv setContentOffset:(CGPoint){to*iScreenW,ws.bgsv.contentOffset.y}];
            }];
        }
    }];
    [self.view addSubview:self.selev];
    
    
    self.beenNcoll=[[YFBennNCollectV alloc] initWithFrame:(CGRect){0,self.view.h-44,self.view.w,44}];
    [self.view addSubview:self.beenNcoll];
    
    
}

-(void)initNav{
    self.nav=[[YFNavBar alloc] initWithFrame:(CGRect){0,0,iScreenW,64}];
    [self.view addSubview:self.nav];
    [self.nav setDict:@{@"title":@"维尼的小熊最爱吃烧烤和火锅",@"subti":@"Cooper&Looper"}];
    __weak typeof(self) ws=self;
    [self.nav setOnClick:^(NSInteger idx) {
        if(idx==0){
            [ws.navigationController popViewControllerAnimated:YES];
        }else{
            [[[YFUnLoginView alloc] init] showToView:ws.view];;
        }
    }];
}

#pragma mark-
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView==self.infotv||scrollView==self.recommtv){
        
//        CGFloat yoff=scrollView.contentOffset.y;
//        CGFloat delt=yoff+245;
//        self.topsv.y=-delt;
        CGFloat yoff=scrollView.contentOffset.y;
        CGFloat seleoffy=yoff-_scrolly;
        _scrolly=yoff;
        self.topsv.y-=seleoffy;
        
        CGFloat startf=180,navih=64;

        CGFloat showa = (yoff+startf) / (startf-navih-SelVH);

        if(showa>=.98){
            [UIView animateWithDuration:.04 animations:^{
                self.nav.bg.alpha=1;
            }];
        }else{
            self.nav.bg.alpha=0;
        }

        self.topsv.nav.alpha=showa;
        self.nav.subti.alpha=1-showa;
        self.nav.iv.alpha=1-showa;
        
        if(yoff>=-(navih+SelVH)){
            self.selev.y=navih;
        }else{
            self.selev.y=self.topsv.b;
        }
        CGFloat scale=1-(yoff+SelVH+HeadH)/100;
        scale=scale>1?scale:1;
        
        CGAffineTransform tran=CGAffineTransformMakeScale(scale, scale);
        CGFloat ty=(1-scale)*HeadH;
        self.topsv.transform=CGAffineTransformTranslate(tran, 0, ty*.2);
        
        
        if (self.selev.y >=64 && self.selev.y<=HeadH) {
            
            if (scrollView == self.recommtv) {
                
                self.infotv.contentOffset = (CGPoint){0, -self.selev.b};
                
            } else {
                
                self.recommtv.contentOffset = (CGPoint){0,-self.selev.b};
                
            }
        }
        
        
        
    }else if(scrollView==self.bgsv){
        
        CGFloat seloffy=self.selev.y-HeadH;
        if(seloffy!=-HeadH&&seloffy<=0){
            
        }
        
        
        CGFloat xoff=self.bgsv.contentOffset.x;
        CGFloat idx=xoff/iScreenW;
        [self.selev lineToIdx:round(idx)];
    }
}


#pragma  mark UITableviewdelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==self.infotv&&indexPath.row==0){
      [self.navigationController showViewController:[[YFMapVC alloc]init] sender:0];
    }else if(tableView==self.infotv&&indexPath.row==1){
       YFInfoM *m= self.infotv.datas[indexPath.row];
        [[[UIActionSheet alloc] initWithTitle:@"choose tel num" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:m.title otherButtonTitles:m.subTitle, nil] showInView:self.view];
    }
}


#pragma mark   UIActionsheedelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%@",[actionSheet buttonTitleAtIndex:buttonIndex]);
    if(buttonIndex!=actionSheet.numberOfButtons-1){
        [iApp openURL:iURL(iFormatStr(@"tel://%@",[actionSheet buttonTitleAtIndex:buttonIndex]))];
    }
}




@end
