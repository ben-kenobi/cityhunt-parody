//
//  YFInfoCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFInfoCell.h"
#import "YFInfoM.h"
@interface YFInfoCell ()
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *subti;

@end

@implementation YFInfoCell


-(void)initUI{
    UIImageView *iv= [[UIImageView alloc]initWithFrame:(CGRect){10,10,30,30}];
    iv.image=img(@"InfoPicInfo");
    [self.contentView addSubview:iv];
    UIImageView *ivr=[[UIImageView alloc] initWithImage:img(@"ContentToRightTag")];
    [self.contentView addSubview:ivr];
    [ivr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-13);
        make.top.equalTo(@15);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    self.rightiv=ivr;
    
    
    UILabel *(^newlab)()=^(){
        UILabel *lab=[[UILabel alloc] init];
        [lab setTextColor:[UIColor grayColor]];
        [self.contentView addSubview:lab];
        [lab setNumberOfLines:0];
        return lab;
    };
    self.title=newlab();
    self.subti=newlab();
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@60);
        make.right.equalTo(@-60);
        make.top.equalTo(@10);

    }];
    
    [self.subti mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title);
        make.right.equalTo(@-20);
        make.top.equalTo(self.title.mas_bottom).offset(10);
    }];
    
    UIView *line=[[UIView alloc] init];
    [self.contentView addSubview:line];
    [line setBackgroundColor:[UIColor grayColor]];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subti.mas_bottom).offset(10);
        make.bottom.equalTo(@-1);
        make.height.equalTo(@.7);
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
    }];
    self.line=line;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initUI];
    }
    return self;
}

+(instancetype)cellWithTv:(UITableView *)tv m:(YFInfoM *)m{
    static NSString *const iden=@"infocelliden";
    YFInfoCell *cell= [tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[self alloc] initWithStyle:0 reuseIdentifier:iden];
    }
    cell.m=m;
    return cell;
}
-(void)setM:(YFInfoM *)m{
    _m=m;
    self.title.text=m.title;
    self.subti.text=m.subTitle;
    self.rightiv.hidden=!m.isShowImage;

}

@end
