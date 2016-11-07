
//
//  YFRecommPicCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFRecommPicCell.h"
#import "UIImageView+WebCache.h"
#import "YFRecommM.h"

@interface YFRecommPicCell ()
@property (nonatomic,strong)UIImageView *iv;

@end

@implementation YFRecommPicCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.iv=[[UIImageView alloc] init];
        [self.contentView addSubview:self.iv];
        [self.iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.top.equalTo(@0);
            make.height.equalTo(self.iv.mas_width);
            make.bottom.equalTo(@-10);
        }];
    }
    return self;
}

+(instancetype)cellWithTv:(UITableView *)tv m:(YFRecommM *)m{
    static NSString *iden=@"piccelliden";
    YFRecommPicCell *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[self alloc] initWithStyle:(UITableViewCellStyle) 0 reuseIdentifier:iden];
    }
    cell.m=m;
    return cell;
}

-(void)setM:(YFRecommM *)m{
    _m=m;
    [self.iv sd_setImageWithURL:iURL(_m.pic) placeholderImage:img(@"cover_headerView")];
}

@end
