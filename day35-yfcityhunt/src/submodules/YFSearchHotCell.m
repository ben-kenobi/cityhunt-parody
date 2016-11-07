
//
//  YFSearchHotCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSearchHotCell.h"

@interface YFSearchHotCell ()
@property (nonatomic,strong)NSArray *btns;
@end

@implementation YFSearchHotCell
+(instancetype)cellWithTv:(UITableView *)tv m:(NSArray *)hots{
    static NSString *const iden=@"hotcelliden";
    YFSearchHotCell *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell=[[self alloc] initWithStyle:0 reuseIdentifier:iden];
    }
    cell.hots=hots;
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIButton *(^newb)()=^(){
            UIButton *b=[[UIButton alloc] init];
            [b setTitleColor:iColor(81, 143, 120, 1) forState:UIControlStateNormal];
            [b setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            [b setBackgroundColor:iColor(55, 255, 205, 1)];
            [b.layer setMasksToBounds:YES];
            [b.layer setCornerRadius:15];
            [b setContentEdgeInsets:(UIEdgeInsets){0,13,0,13}];
            [self.contentView addSubview:b];
            [b mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@34);
                make.centerY.equalTo(@0);
                make.width.greaterThanOrEqualTo(@50);
                make.width.lessThanOrEqualTo(@100);
            }];
            [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            return b;
        };
        
        self.btns=@[newb(),newb(),newb(),newb()];
        UIView *last=[[UIView alloc] init];
        [self.contentView addSubview:last];
        [last mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
        }];
        for(int i=0;i<self.btns.count;i++){
            [self.btns[i] mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(last.mas_right);
            }];
            UIView *v=[[UIView alloc] init];
            [self.contentView addSubview:v];
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo([self.btns[i] mas_right]);
                make.width.equalTo(last);
            }];
            last=v;
        }
        [last mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@0);
        }];
        
        
    }
    return self;
}
-(void)setHots:(NSArray *)hots{
    _hots=hots;
    for(int i=0;i<self.btns.count;i++){
        if(i<hots.count){
            [self.btns[i] setHidden:NO];
            [self.btns[i] setTitle:hots[i] forState:UIControlStateNormal];
        }else{
            [self.btns[i] setHidden:YES];
        }
        
    }
}

-(void)onBtnClicked:(UIButton *)sender{
    if(self.onClick)
        self.onClick([sender titleForState:UIControlStateNormal]);
}

@end
