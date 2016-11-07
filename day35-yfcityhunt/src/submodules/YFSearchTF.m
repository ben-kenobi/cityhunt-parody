
//
//  YFSearchTF.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSearchTF.h"

@implementation YFSearchTF


-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.placeholder=@"搜索";
        self.font=[UIFont systemFontOfSize:16];
        self.background=[img(@"GroupCell") resizableStretchImg];
        self.clearButtonMode=UITextFieldViewModeAlways;
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=5;
        
        UIView *view=[[UIView alloc] initWithFrame:(CGRect){0,0,40,self.h}];
        UIImageView *iv=[[UIImageView alloc] initWithFrame:(CGRect){0,0,35,35}];
        iv.center=view.innerCenter;
        [view addSubview:iv];
        iv.image=img(@"searchm");
        self.leftView=view;
        self.leftViewMode=UITextFieldViewModeAlways;
    }
    return self;
}

@end
