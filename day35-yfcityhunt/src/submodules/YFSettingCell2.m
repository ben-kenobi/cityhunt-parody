//
//  YFSettingCell2.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSettingCell2.h"
@interface YFSettingCell2()

@end

@implementation YFSettingCell2

+(instancetype)cellWithTv:(UITableView *)tv dict:(NSDictionary *)dict{
    static NSString *const iden=@"settingcell2iden";
    YFSettingCell2 *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[self alloc] initWithStyle:0 reuseIdentifier:iden];
    }
    
    cell.dict=dict;
    return cell;
}

-(void)updateUI{
    if(_dict[@"icon"])
       [self.icon setImage:img(_dict[@"icon"]) forState:UIControlStateNormal];
    else
        [self.icon setImage:0 forState:UIControlStateNormal];
    UIColor *color=_dict[@"textColor"]?[UIColor colorWithHex:_dict[@"textColor"]]:[UIColor blackColor];
    
    [self.icon setTitleColor:color forState:UIControlStateNormal];
    [self.icon setTitle:_dict[@"title"] forState:UIControlStateNormal];
    [self.riv setImage:[UIImage imageNamed:_dict[@"acname"]]];
    
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    [self updateUI];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIView *view=[[UIView alloc] init];
        view.layer.cornerRadius=10;
        view.layer.masksToBounds=YES;
         [self.contentView addSubview:view];
       
        [view setBackgroundColor:[UIColor whiteColor]];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.right.equalTo(@0);
            make.bottom.equalTo(@-3);
        }];
       
        self.icon=[[UIButton alloc] init];
        [view addSubview:self.icon];
        self.riv=[[UIImageView alloc] init];
        [view addSubview:self.riv];
        [self.icon setTitleEdgeInsets:(UIEdgeInsets){0,10,0,0}];
        [self.icon setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@25);
            make.centerY.equalTo(@0);
            make.width.equalTo(view).multipliedBy(.5);
        }];
        self.icon.enabled=NO;
        [self.icon.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.riv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-15);
            make.centerY.equalTo(@0);
            make.height.equalTo(view).multipliedBy(.3);
            make.width.equalTo(@10);
        }];
        self.riv.contentMode=UIViewContentModeScaleAspectFit;
        self.riv.clipsToBounds=NO;
        
        
        
        self.rlab=[[UILabel alloc] init];
        self.rlab.textColor=[UIColor grayColor];
        [view addSubview:self.rlab];
        [self.rlab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.riv.mas_left).offset(-10);
            make.centerY.equalTo(@0);
        }];
        UIView *bg=[[UIView alloc] init];
        view.layer.cornerRadius=10;
        view.layer.masksToBounds=YES;
        [bg setBackgroundColor:[UIColor lightGrayColor]];
        [self setSelectedBackgroundView:bg];
        [self setSelectionStyle:0];
    }
    return self;
}


@end
