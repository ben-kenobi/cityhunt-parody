//
//  YFSearchHV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSearchHV.h"
@interface YFSearchHV()
@property (nonatomic,strong)UILabel *lab;
@end


@implementation YFSearchHV

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithReuseIdentifier:reuseIdentifier]){
        self.contentView. backgroundColor=iColor(230, 230, 230, 1);
        self.lab=[[UILabel alloc] init];
        self.lab.textColor=[UIColor lightGrayColor] ;
        self.lab.font=[UIFont systemFontOfSize:20] ;
        [self.contentView addSubview:self.lab];
        [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.leading.equalTo(@20);
        }];
    }
    return self;
}

+(instancetype)hvWithTv:(UITableView *)tv m:(NSString *)str{
    static NSString *const iden=@"hviden";
    YFSearchHV *hv=[tv dequeueReusableCellWithIdentifier:iden];
    if(!hv){
        hv=[[self alloc] initWithReuseIdentifier:iden];
    }
    
    hv.lab.text=str;
    return hv;
}

@end
