//
//  YFVC.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/13.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFVC : UIViewController

@property (nonatomic,strong)UIButton *cover;
@property (nonatomic,strong)void(^onCoverRm)();
@property (nonatomic,assign)BOOL isScale;

-(void)coverClick;
-(void)leftClick;

@end
