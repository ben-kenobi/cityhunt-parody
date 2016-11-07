
//
//  YFBlurV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFBlurV.h"
#import "YFFoundCellM.h"
#import "YFBlurCell.h"
@interface YFBlurV ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *cv;
@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,strong)UIButton *cancel;
@end


static NSString *const celliden=@"blurcelliden";

@implementation YFBlurV


-(instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.userInteractionEnabled=YES;
        self.alpha=0;
       UIVisualEffectView *effv= [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        effv.frame=self.bounds;
        effv.contentView.backgroundColor=[UIColor greenColor];
        effv.contentView.alpha=0;
        [self addSubview:effv];
        
        self.cancel=[UIButton buttonWithType:0];
        [self.cancel setImage:img(@"searchList_btn_delete_6P") forState:UIControlStateNormal];
        self.cancel.frame=(CGRect){.5*(self.w-30),self.h-50,30,30};
        [self.cancel addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancel];
        
        UICollectionViewFlowLayout *lo=[[UICollectionViewFlowLayout alloc] init];
        CGFloat itemw=100;
        lo.itemSize=(CGSize){itemw,itemw};
        lo.minimumInteritemSpacing=0;
        lo.minimumLineSpacing=20;
        lo.sectionInset=(UIEdgeInsets){20,(self.w-3*itemw)/4, 20,(self.w-3*itemw)/4};
        self.cv=[[UICollectionView alloc] initWithFrame:(CGRect){0,60,self.w,self.h-60-50} collectionViewLayout:lo];
        self.cv.delegate=self;
        self.cv.dataSource=self;
        self.cv.backgroundColor=[UIColor clearColor];
        [self addSubview:self.cv];
        [self.cv registerClass:[YFBlurCell class] forCellWithReuseIdentifier:celliden];
        [self loadDatas];
    }
    
    return self;
}
-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.cancel){
        self.onClick(0);
        [self hide];
    }
}
-(void)hide{
    [UIView animateWithDuration:.3 animations:^{
        self.alpha=0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma mark-
#pragma mark collectionVdelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(self.datas.count)
        return [self.datas[section] count];
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YFBlurCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:celliden forIndexPath:indexPath];
    cell.m=self.datas[indexPath.section][indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.onClick([self.datas[indexPath.section][indexPath.row] title]);
    [self hide];
}







-(void)loadDatas{
    [self appendDatas:iRes4ary(@"blurData.plist")];
}
-(void)appendDatas:(NSArray *)datas{
    for(NSArray *ary in datas){
        NSMutableArray *temp=[NSMutableArray array];
        for(NSDictionary *dict in ary){
            [temp addObject:[YFFoundCellM setDict:dict]];
        }
        [self.datas addObject:temp];
    }
    [self.cv reloadData];
}

iLazy4Ary(datas, _datas)
@end
