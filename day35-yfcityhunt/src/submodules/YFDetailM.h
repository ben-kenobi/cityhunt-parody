//
//  YFDetailM.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/19.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFDetailM : NSObject
/** detail列表 */
@property (nonatomic, strong) NSArray *poi_list;

/** 头部信息 */
@property (nonatomic, strong) NSDictionary *section_info;

/** 推荐tableveiw数据 */
@property (nonatomic, strong) NSArray *article_list;


@end
