//
//  YFFoundCVCell.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YFFoundM;
@interface YFFoundCVCell : UICollectionViewCell
@property (nonatomic,strong)YFFoundM *m;
@property (nonatomic,copy)void (^onClick)(YFFoundM *m);
@end
