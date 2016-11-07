//
//  YFInfoTV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFInfoTV.h"
#import "YFDetailFooterV.h"
#import "YFInfoM.h"
#import "YFInfoCell.h"
#import <MAMapKit/MAMapKit.h>
#import "YFInfoDetailVC.h"

@interface YFInfoTV ()<MAMapViewDelegate>
@property (nonatomic,strong)YFDetailFooterV *footer;
@property (nonatomic,strong)MAMapView *map;
@end

@implementation YFInfoTV

-(void)initUI{
    self.mclz=[YFInfoM class];
    self.footer=[[YFDetailFooterV alloc] initWithFrame:(CGRect){0,0,self.w,200}];
    __weak typeof (self) ws=self;
    [self.footer setOnClick:^(NSInteger idx) {
        if(idx!=5){
             [ws.vc.navigationController showViewController:[[YFInfoDetailVC alloc] init] sender:0] ;
        }
    }];
    
//    [MAMapServices sharedServices].apiKey = @"2e6b9f0a88b4a79366a13ce1ee9688b8";
//    self.map=[[MAMapView alloc] initWithFrame:(CGRect){0,0,self.w,220}];
//    self.map.delegate=self;
//    self.map.showsScale=NO;
//    self.map.showsCompass=NO;
//    self.map.showsUserLocation=YES;
//    self.map.logoCenter=(CGPoint){self.w-self.map.logoSize.width+5,220-self.map.logoSize.height};
//    self.map.zoomEnabled=NO;
//    self.map.scrollEnabled=NO;
//    [self.map setCenterCoordinate:CLLocationCoordinate2DMake(39.906598, 116.400673) animated:YES];
//    self.map.zoomLevel=14;
//    
//    MAPointAnnotation *pa=[[MAPointAnnotation alloc] init];
//    pa.coordinate=CLLocationCoordinate2DMake(39.906598, 116.400673);
//    [_map addAnnotation:pa];
//    self.tableHeaderView=self.map;
   
    
    self.tableFooterView=_footer;
    self.mclz=[YFInfoM class];
    self.rowHeight=UITableViewAutomaticDimension;
    self.estimatedRowHeight=44;
    
}
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    if([annotation isKindOfClass:[MAPointAnnotation class]]){
        static NSString *iden=@"paiden";
        MAAnnotationView *anov=[mapView dequeueReusableAnnotationViewWithIdentifier:iden];
        if(!anov){
            anov=[[MAAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:iden];
        }
        anov.image=img(@"map_activity");
        anov.layer.anchorPoint=(CGPoint){.5,1};
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YFInfoCell *cell=[YFInfoCell cellWithTv:tableView m:self.datas[indexPath.row]];
    if(indexPath.row==self.datas.count-1){
        cell.line.hidden=YES;
    }else{
        cell.line.hidden=NO;
    }
    return cell;
    
}

@end
