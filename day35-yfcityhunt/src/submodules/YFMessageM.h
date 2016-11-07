//
//  YFMessageM.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFMessageM : NSObject
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *message;
-(NSString *)mesTopic;
@end
