//
//  YFSettingTv.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSettingTv.h"
#import "YFSettingCell2.h"
@interface YFSettingTv ()<UITableViewDataSource>



@end

@implementation YFSettingTv
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.datas[section][@"items"] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   return [YFSettingCell2 cellWithTv:tableView dict:[self dictByIdx:indexPath]];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.datas[section][@"header"];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return self.datas[section][@"footer"];
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self=[super initWithFrame:frame style:style]){
        self.dataSource=self;
    }
    return self;
}

-(void)appendDatas:(NSArray *)datas{
    [self.datas addObjectsFromArray:datas];
    [self reloadData];
}


-(NSDictionary *)dictByIdx:(NSIndexPath *)idx{
    return self.datas[idx.section][@"items"][idx.row];
}

iLazy4Ary(datas, _datas)
@end
