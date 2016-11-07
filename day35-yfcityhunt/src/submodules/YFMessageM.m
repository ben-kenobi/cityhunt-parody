//
//  YFMessageM.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFMessageM.h"

@implementation YFMessageM
-(NSString *)mesTopic{
    NSInteger from=[_message rangeOfString:@"【"].location+1;
    NSInteger to=[_message rangeOfString:@"】"].location;
    return [_message substringWithRange:(NSRange){from,to-from}];
}
@end
