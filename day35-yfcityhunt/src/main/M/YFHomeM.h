//
//  YFHomeM.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/15.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFHomeM : NSObject

//headView的颜色
@property (nonatomic, copy) NSString *color;
/** headView的title */
@property (nonatomic, copy) NSString *tag_name;
/** headView的subTitle */
@property (nonatomic, copy) NSString *section_count;
/** cell模型 */
@property (nonatomic, strong) NSArray *body;

@end
