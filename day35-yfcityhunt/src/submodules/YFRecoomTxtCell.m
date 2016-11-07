//
//  YFRecoomTxtCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFRecoomTxtCell.h"
#import "YFRecommM.h"
@interface YFRecoomTxtCell ()
@property (nonatomic,strong)UILabel *title;


@end
@implementation YFRecoomTxtCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.title=[[UILabel alloc] init];
        self.title.textColor=[UIColor grayColor];
        [self.title setNumberOfLines:0];
          [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(@-13);
            make.top.left.equalTo(@13);

            
        }];
        self.backgroundColor=[UIColor whiteColor];
        self.selectionStyle=0;
        
    }
    return self;
}

+(instancetype)cellWithTv:(UITableView *)tv m:(YFRecommM *)m{
    static NSString *const iden=@"remcelliden";
    YFRecoomTxtCell *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[self alloc] initWithStyle:0 reuseIdentifier:iden];
        
    }
    cell.m=m;
    return cell;
}

-(void)setM:(YFRecommM *)m{
    _m=m;
    self.title.text=m.ch;
}
@end
