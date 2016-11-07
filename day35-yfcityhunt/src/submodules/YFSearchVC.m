


//
//  YFSearchVC.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSearchVC.h"
#import "YFSearchTv.h"
#import "UIBarButtonItem+Ex.h"
#import "YFSearchTF.h"


@interface YFSearchVC ()<UITextFieldDelegate>
@property (nonatomic,strong)YFSearchTv *tv;
@property (nonatomic,strong)YFSearchTF *search;
@end

@implementation YFSearchVC

-(void)initUI{
    __weak typeof (self) ws=self;
    self.view.backgroundColor=[UIColor whiteColor] ;
    self.tv=[[YFSearchTv alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tv];
    [self.tv setOnTouch:^{
        [ws.search resignFirstResponder ];
    }];
    
    YFSearchTF *search=[[YFSearchTF alloc] initWithFrame:(CGRect){0,0,self.view.w*.7,30}];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:search];
    search.delegate=self;
    UIBarButtonItem *cancel=[UIBarButtonItem initWithTitle:@"取消" titleColor:[UIColor whiteColor] target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem=cancel;
    self.search=search;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
    [self loadDatas];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.search becomeFirstResponder];
}


-(void)loadDatas{
  NSArray *ary=[NSArray arrayWithContentsOfFile:[SEARCHHISFILE strByAppendToDocPath]];
    NSArray *hotary=  @[@[@"下午茶", @"火锅", @"温泉", @"杭州"],@[@"下午茶2", @"火锅2", @"温泉2", @"杭州2"],@[@"下午茶3", @"火锅3"]];
    if(ary.count)
        [self.tv appendDatas:@[ary,hotary]];
    else
        [self.tv appendDatas:@[hotary]];
}


-(void)back{
    [self.search resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark UITextfieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.text.length){
        [self.tv onSearch:textField.text];
        textField.text=@"";
    }
    return YES;
}


@end
