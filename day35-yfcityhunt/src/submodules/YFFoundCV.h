//
//  YFFoundCV.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFFoundCV : UICollectionView
@property (nonatomic,weak)UIViewController *vc;
@property (nonatomic,strong)NSMutableArray *datas;
-(void)appendDatas:(NSArray *)datas;

@end
