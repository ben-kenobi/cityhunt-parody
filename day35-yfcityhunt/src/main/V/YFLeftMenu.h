//
//  YFLeftMenu.h
//  day35-yfcityhunt
//
//  Created by apple on 15/11/13.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NoHLBtn : UIButton

@end

@interface CityBtn : NoHLBtn

@end


typedef NS_ENUM(NSInteger, LeftButtonType) {
    LeftButtonTypeHome=0,
    LeftButtonTypeFound,
    LeftButtonTypeIcon,
    LeftButtonTypeSina,
    LeftButtonTypeWeixin,
    LeftButtonTypeMessage,
    LeftButtonTypeSetting
};

@interface YFLeftMenu : UIView

@property (nonatomic,copy)void(^onClick)(LeftButtonType from,LeftButtonType to);


-(void)onCoverRm;

@end
