//
//  YFSettingVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSettingVC.h"
#import "YFSettingTv.h"
@interface YFSettingVC ()<UITableViewDelegate,UIAlertViewDelegate>
@property (nonatomic,strong)YFSettingTv *tv;
@property (nonatomic,strong)UIButton *btn;
@end

@implementation YFSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"setting";
    self.navigationItem.rightBarButtonItem=nil;
    
    self.tv=[[YFSettingTv alloc] initWithFrame:(CGRect){25,0,self.view.w-50,self.view.h-64} style:
             UITableViewStyleGrouped];
    [self.view addSubview:self.tv];
    [self.tv setSeparatorStyle:0];
    [self.tv setBackgroundColor:[UIColor clearColor]];
    [self.tv appendDatas:iRes4ary(@"setting.plist")];
    [self.tv setRowHeight:60];
    UIView *footer=[[UIView alloc] init];
    [self.tv setTableFooterView:footer];
    [self.tv setDelegate:self];
    
    self.btn=[[UIButton alloc] init];
    self.btn.layer.cornerRadius=11;
    [self.btn.layer setMasksToBounds:YES];
    [self.tv addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footer.mas_bottom).offset(10);
        make.centerX.equalTo(@0);
        make.height.equalTo(@60);
        make.width.equalTo(self.view).offset(-50);
    }];
    [self.btn setBackgroundImage:img(@"button_login_bg_6P") forState:UIControlStateNormal] ;
    [self.btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
        [FileUtil clearFileAtPath:[FileUtil cachePath]];
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        self.btn.hidden=NO;
    }else{
        if(indexPath.row==0){
            NSString *size=[FileUtil formatedFileSize:[FileUtil fileSizeAtPath:[FileUtil cachePath]]];
            UIAlertView *aler=[[UIAlertView alloc] initWithTitle:@"title" message:iFormatStr(@"缓存大小 %@",size) delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"清理", nil];
            [aler show];
            
        }else if(indexPath.row==1){
            [iApp openURL:iURL(@"http://www.baidu.com")];
        }else if(indexPath.row==2){
            [iApp openURL:iURL(@"http://www.baidu.com")];
        }
    }
}

-(void)onBtnClicked:(UIButton *)sender{
    self.btn.hidden=YES;
}




@end
