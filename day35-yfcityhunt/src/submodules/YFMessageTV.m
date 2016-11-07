


//
//  YFMessageTV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/21.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFMessageTV.h"
#import "YFMessageM.h"
#import "YFMesCell.h"
@interface YFMessageTV ()

@end

@implementation YFMessageTV
-(void)initUI{
    self.mclz=[YFMessageM class];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YFMesCell *cell= [YFMesCell cellWithTv:tableView m:self.datas[indexPath.row] edit:self.edit];
    [cell setOnDel:self.onDel];
    return cell;
}

-(void)setEdit:(BOOL)edit{
    if(edit!=_edit){
        _edit= edit;
        [self reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.onDel){
        self.onDel(self.datas[indexPath.row],1);
    }
}
@end
