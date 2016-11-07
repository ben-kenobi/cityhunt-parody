//
//  YFHomeCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFHomeCell.h"
#import "UIImageView+WebCache.h"
#import "YFHomeCellM.h"
@interface YFHomeCell ()
@property (nonatomic,weak)UIImageView *bg;
@property (nonatomic,weak)UILabel *title;
@property (nonatomic,weak)UILabel *name;
@property (nonatomic,weak)UILabel *praise;

@end

@implementation YFHomeCell


+(instancetype)cellWithTv:(UITableView *)tv m:(YFHomeCellM *)m{
    static NSString *const iden=@"homecelliden";
    YFHomeCell *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[YFHomeCell alloc] initWithStyle:0 reuseIdentifier:iden];
    }
    [cell setM:m];
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initUI];
        self.contentView.backgroundColor=iColor(51, 52, 53, 1);
        self.selectionStyle=0;
    }
    return self;
}

-(void)setM:(YFHomeCellM *)m{
    _m=m;
//    [self.bg sd_setImageWithURL:iURL(m.imageURL) placeholderImage:img(@"ContentViewNoImages")];
    [self.bg setImage:img(@"food")];
    self.title.text=m.section_title;
    self.name.text=m.poi_name;
    self.praise.text=m.fav_count;
}



-(void) initUI{
    UIImageView *bg=[[UIImageView alloc] init];
    [self.contentView addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.right.equalTo(@0);
        make.bottom.equalTo(@-8);
    }];
    self.bg=bg;
    
    UILabel *(^newlab)(UIColor *,UIFont *)=^(UIColor *color,UIFont *font){
        UILabel *lab=[[UILabel alloc] init];
        [lab setTextColor:color];
        [lab setFont:font];
        [self.contentView addSubview:lab];
        return lab;
    };
    
    UIImageView *(^newiv)(UIImage *)=^(UIImage *img){
        UIImageView *iv=[[UIImageView alloc] initWithImage:img];
        [self.contentView addSubview:iv];
        return iv;
    };
    
    self.title=newlab([UIColor whiteColor],[UIFont boldSystemFontOfSize:20]);
    self.name=newlab([UIColor whiteColor],[UIFont boldSystemFontOfSize:13]);
    self.praise=newlab([UIColor whiteColor],[UIFont boldSystemFontOfSize:13]);
    
    UIImageView *nav=newiv(img(@"index_navigation_nearby"));
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@18);
        make.bottom.equalTo(@-18);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nav.mas_right).offset(8);
        make.centerY.equalTo(nav);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nav);
        make.bottom.equalTo(nav.mas_top).offset(-15);
    }];
    [self.praise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-18);
        make.centerY.equalTo(nav);
    }];
    
    [newiv(img(@"discoverNav_collectionHeart")) mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.praise.mas_left).offset(-5);
        make.centerY.equalTo(nav);
    }];
    
    
    
    
    
}






@end
