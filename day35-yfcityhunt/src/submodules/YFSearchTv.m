

//
//  YFSearchTv.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/20.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFSearchTv.h"
#import "YFSearchHotCell.h"
#import "YFSearchHisCell.h"
#import "YFSearchHV.h"
@interface YFSearchTv ()


@end


@implementation YFSearchTv
-(void)initUI{
    [self setRowHeight:50];

}


-(void)onSearch:(NSString *)name{
    NSMutableArray *his;
    BOOL hashis= self.datas.count>1;
    if(hashis)
        his=self.datas[0];
    else
        his=[NSMutableArray array];
    if(![his containsObject:name]){
        [his insertObject:name atIndex:0];
        [his writeToFile: [SEARCHHISFILE strByAppendToDocPath] atomically:YES];
        if(hashis){
            [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]] withRowAnimation:0];
        }else{
            [self.datas insertObject:his atIndex:0];
            [self reloadData];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.datas[section] count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.datas.count>1&&!indexPath.section){
        NSMutableArray *hises= self.datas[indexPath.section];
        YFSearchHisCell *cell =[YFSearchHisCell cellWithTv:tableView m:hises[indexPath.row]];
        [cell setOnDel:^(NSString *name) {
            NSIndexPath *path=[NSIndexPath indexPathForItem:[hises indexOfObject:name] inSection:0];
            [hises removeObject:name];
            if(hises.count){
                [self deleteRowsAtIndexPaths:@[path] withRowAnimation:0];
            }else{
                [self.datas removeObject:hises];
                [self reloadData];
            }
            [hises writeToFile: [SEARCHHISFILE strByAppendToDocPath] atomically:YES];
        }];
        return cell;
    }else{
        
        YFSearchHotCell *cell= [YFSearchHotCell cellWithTv:tableView m:self.datas[indexPath.section][indexPath.row]];
        [cell setOnClick:^(NSString *name) {
           
            [self onSearch:name];
                
        }];
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    NSString *str= self.datas.count>1&&!section?@"历史":@"热门";
    return [YFSearchHV hvWithTv:tableView m:str];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.onTouch)
    self.onTouch();
}


-(void)appendDatas:(NSArray *)datas{
    for(NSArray *ary in datas){
        [self.datas addObject:[NSMutableArray arrayWithArray:ary]];
    }
}
@end
