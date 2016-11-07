//
//  YFCommonTv.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFCommonTv.h"
@interface YFCommonTv ()
@end

@implementation YFCommonTv

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self=[super initWithFrame:frame style:style]){
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor whiteColor];
        self.separatorStyle=0;
        [self initUI];
    }
    return self;
}
-(void)initUI{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell= [[UITableViewCell alloc] init];
    [cell setBackgroundColor:[UIColor randomColor]];
    return cell;
}


-(void)appendDatas:(NSArray *)datas{
    if(self.mclz){
        for(NSDictionary *dict in datas){
            [self.datas addObject:[self.mclz setDict:dict]];
        }
    }else{
        [self.datas addObjectsFromArray:datas];
    }
    [self reloadData];
}
iLazy4Ary(datas, _datas)
@end
