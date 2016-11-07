
//
//  YFSearchHisCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSearchHisCell.h"

@interface YFSearchHisCell ()

@property (nonatomic,strong)UIView *line;
@end

@implementation YFSearchHisCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.title=[[UILabel alloc] init];
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@21);
            make.centerY.equalTo(@0);
        }];
        [self.title setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.del=[[UIButton alloc] init];
        [self.del setImage:img(@"searchList_btn_delete_6P") forState:UIControlStateNormal];
        [self.contentView addSubview:self.del];
        [self.del mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(@20);
            make.right.equalTo(@-15);
            make.centerY.equalTo(@0);
        }];
        [self.del addTarget:self action:@selector(del:) forControlEvents:UIControlEventTouchUpInside];
        UIView *line=[[UIView alloc] init];
        [self.contentView addSubview:line];
        [line setBackgroundColor:[UIColor grayColor]];
        line.alpha=.1;
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.right.equalTo(@-20);
            make.bottom.equalTo(@0);
            make.height.equalTo(@1);
        }];
        self.line=line;

    }
    return self;
}
+(instancetype)cellWithTv:(UITableView *)tv m:(NSString *)str{
   static  NSString *const iden=@"hiscelliden";
    YFSearchHisCell *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[self alloc] initWithStyle:0 reuseIdentifier:iden];
    }
    cell.name=str;
    cell.title.text=str;
    return cell;
}
-(void)del:(UIButton *)sender{
    if(self.onDel)
        self.onDel(self.name);
}


@end
