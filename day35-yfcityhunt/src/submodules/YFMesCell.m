

//
//  YFMesCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFMesCell.h"
#import "YFMessageM.h"

@interface YFMesCell ()

@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UILabel *date;
@property (nonatomic,strong)UILabel *content;
@property (nonatomic,strong)UILabel *more;
@property (nonatomic,strong)UIButton *del;
@property (nonatomic,strong)UIImageView *next;

@end

@implementation YFMesCell

+(instancetype)cellWithTv:(UITableView*)tv m:(YFMessageM *)m edit:(BOOL)edit{
    static NSString *const iden=@"mescelliden";
    YFMesCell *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[self alloc] initWithStyle:0  reuseIdentifier:iden];
        cell.selectionStyle=0;
        cell.del.alpha=edit?1:0;
        cell.next.alpha=edit?0:1;
    }
    [UIView animateWithDuration:.3 animations:^{
        cell.del.alpha=edit?1:0;
        cell.next.alpha=edit?0:1;
    }];
    cell.m=m;
    return cell;
}

-(void)setM:(YFMessageM *)m{
    _m=m;
    self.name.text=@"From Name";
    self.date.text=m.date;
    self.content.text=m.message;
}



-(void)initUI{
    self.backgroundColor=[UIColor clearColor];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    UIView *view=[[UIView alloc] init];
    [view setBackgroundColor:[UIColor whiteColor]];
    view.layer.cornerRadius=6;
    view.layer.masksToBounds=YES;
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@20);
        make.right.equalTo(@-20);
        make.bottom.equalTo(@0);
    }];
    CGFloat pad=10;
    self.icon=[[UIImageView alloc] initWithFrame:(CGRect){pad,pad,45,40}];
    self.icon.image=img(@"cutC");
    [view addSubview:self.icon];
    UILabel *(^newlab)(UIFont *,UIColor *,NSInteger)=^(UIFont *font,UIColor *color,NSInteger line){
        UILabel *lab=[[UILabel alloc] init];
        lab.numberOfLines=line;
        [lab setFont:font];
        [lab setTextColor:color];
        [view addSubview:lab];
        return lab;
    };
    self.name=newlab(iBFont(18),[UIColor blackColor],1);
    self.date=newlab(iFont(15),[UIColor grayColor],1);
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(pad);
        make.top.equalTo(@(pad));
    }];
    [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.top.equalTo(self.name.mas_bottom).offset(5);
    }];
    self.content=newlab(iFont(18),[UIColor grayColor],0);
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(pad));
        make.right.equalTo(@(-pad));
        make.top.equalTo(self.icon.mas_bottom).offset(pad);
        make.bottom.equalTo(view).offset(-70);
    }];
    
    
    self.more=newlab(iFont(17),[UIColor grayColor],1);
    [self.more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(pad));
        make.top.equalTo(self.content.mas_bottom).offset(pad);
        make.bottom.equalTo(view).offset(-30);
    }];
    self.more.text=@">>>";
    self.del=[[UIButton alloc] init];
    [self.del setImage:img(@"searchList_btn_delete") forState:UIControlStateNormal];
    [view addSubview:self.del];
    [self.del mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(pad));
        make.right.equalTo(@(-pad*2));
        make.height.width.equalTo(@20);
    }];
    [self.del addTarget:self action:@selector(onDel:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.next=[[UIImageView alloc] init];
    [view addSubview:self.next];
    [self.next setImage:img(@"checkAllUserGoNext")];
    [self.next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(pad*2.5));
        make.right.equalTo(@(-pad*2));
        make.height.equalTo(@15);
        make.width.equalTo(@11);
    }];
}

-(void)onDel:(UIButton *)sender{
    if(self.onDel)
        self.onDel(self.m,0);
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initUI];
    }
    return self;
}

@end
