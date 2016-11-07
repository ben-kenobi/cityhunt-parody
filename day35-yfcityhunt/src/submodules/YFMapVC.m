
//
//  YFMapVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFMapVC.h"
#import <MAMapKit/MAMapKit.h>

@interface YFMapVC ()<MAMapViewDelegate>
@property (nonatomic,strong)MAMapView *mv;
@property (nonatomic,strong)UIView *nav;
@property (nonatomic,strong)UIButton *back;
@property (nonatomic,strong)UILabel *backtitle;
@end

@implementation YFMapVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [[MAMapServices sharedServices] setApiKey:@"2e6b9f0a88b4a79366a13ce1ee9688b8"];
    self.mv=[[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mv.delegate=self;
    self.mv.showsScale=YES;
    self.mv.showsCompass=YES;
    self.mv.showsUserLocation=YES;
    [self.mv setUserTrackingMode:MAUserTrackingModeFollow];
    
    [self.mv setCenterCoordinate:CLLocationCoordinate2DMake(39.906598, 116.400673) animated:YES];
    self.mv.zoomLevel=16;
    [self.view addSubview:self.mv];
    
    MAPointAnnotation *ano=[[MAPointAnnotation alloc]init ];
    ano.coordinate=CLLocationCoordinate2DMake(39.906598, 116.400673);
    [self.mv addAnnotation:ano ];
    if(self.navigationController.navigationBar.hidden){
        self.nav=[[UIView alloc] initWithFrame:(CGRect){0,0,iScreenW,64}];
        self.nav.backgroundColor=iGolbalGreen;
        [self.view addSubview:self.nav];
        
        self.back=[[UIButton alloc] initWithFrame:(CGRect){10,27,25,25}];;
        [self.back addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.back setImage:img(@"back") forState:UIControlStateNormal];
        [self.view addSubview:self.back];
        
        self.backtitle=[[UILabel alloc] initWithFrame:(CGRect){0,18,self.view.w,44}];
        [self.backtitle setTextAlignment:NSTextAlignmentCenter];
        self.backtitle.textColor=[UIColor whiteColor];
        self.backtitle.font=[UIFont systemFontOfSize:20];
        self.backtitle.text=@"location title";
        [self.view addSubview:self.backtitle];
        
    }
    
}

-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.back){
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    if([annotation isKindOfClass:[MAPointAnnotation class]]){
        static NSString *iden=@"anoiden";
        MAAnnotationView *anov=(MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:iden];
        if(!anov){
            anov=[[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:iden];
        }
        anov.image=img(@"map_activity");
        anov.layer.anchorPoint=(CGPoint){.5,.9};
//        anov.centerOffset=(CGPoint){0,-18};
        return anov;
    }
    return 0;
}


-(void)dealloc{
    [self.mv clearDisk];
}
@end
