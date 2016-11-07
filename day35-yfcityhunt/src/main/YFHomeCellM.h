//
//  YFHomeCellM.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/16.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFHomeCellM : NSObject
@property (nonatomic, copy) NSString *section_title;
/** 图片地址 */
@property (nonatomic, copy) NSString *imageURL;
/** 浏览次数 */
@property (nonatomic, copy) NSString *fav_count;
/** 底部名称 */
@property (nonatomic, copy) NSString *poi_name;
@end
