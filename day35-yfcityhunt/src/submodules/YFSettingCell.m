//
//  YFSettingCell.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSettingCell.h"

@implementation YFSettingCell

+(instancetype)cellWithTv:(UITableView *)tv dict:(NSDictionary *)dict{
    NSString *iden;
   UITableViewCellStyle style= [self styleByStr:dict[@"style"] iden:&iden];
    YFSettingCell  *cell=[tv dequeueReusableCellWithIdentifier:iden];
    if(!cell){
        cell =[[YFSettingCell alloc] initWithStyle:style reuseIdentifier:iden];
    }
    [cell setDict:dict];
    return cell;
    
}

-(void)setDict:(NSDictionary *)dict{
    _dict=dict;
    if( _dict[@"icon"])
        self.imageView.image=[UIImage imageNamed:_dict[@"icon"]];
    self.textLabel.text=_dict[@"title"];
    self.detailTextLabel.text=_dict[@"subtitle"];
    self.detailTextLabel.textColor=_dict[@"textColor"]?[UIColor colorWithHex:_dict[@"textColor"]]:[UIColor blackColor];
    self.textLabel.textColor=_dict[@"textColor"]?[UIColor colorWithHex:_dict[@"textColor"]]:[UIColor blackColor];
    Class clz=NSClassFromString(_dict[@"actype"]);
    id obj=[[clz alloc] init];
    if([obj isKindOfClass:[UIImageView class]]){
        [obj setImage:[UIImage imageNamed:_dict[@"acname"]]];
        [obj sizeToFit];
    }else if([obj isKindOfClass:[UISwitch class]]){
        UISwitch *swi=obj;
    }
    
    self.accessoryView=obj;
}

+(UITableViewCellStyle)styleByStr:(NSString *)stystr iden:(NSString **)iden{
    UITableViewCellStyle style=UITableViewCellStyleDefault;
    
    if([[stystr lowercaseString] isEqualToString:[@"UITableViewCellStyleValue1" lowercaseString]]){
        style=UITableViewCellStyleValue1;
    }else if([[stystr lowercaseString] isEqualToString:[@"UITableViewCellStyleValue2" lowercaseString]]){
        style=UITableViewCellStyleValue2;
    }else if([[stystr lowercaseString] isEqualToString:[@"UITableViewCellStyleSubtitle" lowercaseString]]){
        style=UITableViewCellStyleSubtitle;
    }
    
    *iden=[NSString stringWithFormat:@"settingcelliden_%ld",style];
    return style;
}

@end
