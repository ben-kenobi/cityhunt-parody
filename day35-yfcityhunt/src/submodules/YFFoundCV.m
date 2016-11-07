
//
//  YFFoundCV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFFoundCV.h"
#import "YFFoundM.h"
#import "YFFoundCVCell.h"
#import "YFFoundCVheadV.h"
#import "YFShowVC.h"


static NSString *const celliden=@"foundcelliden";
static NSString *const headiden=@"foundheadiden";

@interface YFFoundCV ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>


@end

@implementation YFFoundCV


-(instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *lo=[[UICollectionViewFlowLayout alloc] init];
    [lo setItemSize:(CGSize){100,135}];
    lo.minimumInteritemSpacing=0;
    lo.minimumLineSpacing=20;
    lo.headerReferenceSize=(CGSize){frame.size.width,50};
    CGFloat hmargin=(frame.size.width-3*lo.itemSize.width)/4;
    [lo setSectionInset:(UIEdgeInsets){20,hmargin,20,hmargin}];
    if(self=[super initWithFrame:frame collectionViewLayout:lo]){
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor whiteColor] ;
        [self registerClass:[YFFoundCVCell class] forCellWithReuseIdentifier:celliden];
        [self registerClass:[YFFoundCVheadV class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headiden];
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.datas[section] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.datas.count;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    YFFoundCVheadV *hv=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headiden forIndexPath:indexPath];
    hv.title.text=indexPath.section?@"地区":@"分类";
    hv.line.hidden=!indexPath.section;
        
       return hv;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YFFoundCVCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:celliden forIndexPath:indexPath];
    [cell setOnClick:^(YFFoundM *m) {
       YFShowVC *vc= [[YFShowVC alloc] init];
        vc.title=m.title;
        [self.vc.navigationController showViewController:vc sender:0];
    }];
    cell.m=self.datas[indexPath.section][indexPath.row];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return(section? (CGSize){0,100}: (CGSize){0,50});
}




-(void)appendDatas:(NSArray *)datas{
    
    for(NSArray *ary in datas) {
        NSMutableArray *mary=[NSMutableArray array];
        for(NSDictionary *dict in ary){
            [mary addObject:[YFFoundM setDict:dict]];
        }
        
        [self.datas addObject:mary];
    }
    
    [self reloadData];
}

iLazy4Ary(datas, _datas)
@end
