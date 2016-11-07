//
//  YFLeftMenu.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/13.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFLeftMenu.h"
#import "YFSelCityV.h"



@interface YFLeftMenu ()

@property (nonatomic,strong)UIButton *city;
@property (nonatomic,strong)UIButton *home;
@property (nonatomic,strong)UIButton *discovery;
@property (nonatomic,strong)UIButton *login;
@property (nonatomic,strong)UIButton *sina;
@property (nonatomic,strong)UIButton *wechat;
@property (nonatomic,strong)UIButton *message;
@property (nonatomic,strong)UIButton *setting;
@property (nonatomic,weak)UIButton *cursel;
@property (nonatomic,strong)YFSelCityV *cityv;

@end



@implementation YFLeftMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        
    }
    return self;
}

-(YFSelCityV *)cityv{
    if(!_cityv){
        _cityv=[[YFSelCityV alloc] initWithTopBtn:self.city];
        [_cityv setNames:@[@"北京",@"上海",@"广州",@"福州",@"深圳"]];
        __weak typeof(self) ws=self;
        [self insertSubview:_cityv belowSubview:self.city];
        [_cityv setOnchange:^(NSString *name) {
            [ws.city setTitle:name forState:UIControlStateNormal];
            [ws onBtnClicked:ws.city];
            [ws onBtnClicked:ws.home];
        }];
    }return _cityv;
}
-(void)onBtnClicked:(UIButton *)sender{
    if(sender==self.city){
        self.city.selected =!self.city.selected;
        if(sender.selected){
            [self.cityv toggle:YES];
        }else{
            [self.cityv toggle:NO];
        }
        
    }else{
        if(self.onClick)
            self.onClick(self.cursel.tag,sender.tag);
        if(sender.tag!=LeftButtonTypeIcon&&sender.tag!=LeftButtonTypeSina&&sender.tag!=LeftButtonTypeWeixin){
            self.cursel.selected=NO;
            sender.selected=YES;
            self.cursel=sender;
        }
        [self onCoverRm];
    }
}

-(void)setOnClick:(void (^)(LeftButtonType, LeftButtonType))onClick{
    _onClick=onClick;
    [self onBtnClicked:self.home];
    
}
-(void)onCoverRm{
    if(self.city.selected){
        [self onBtnClicked:self.city];
    }
}





-(void)initUI{
    self.layer.contents=(__bridge id)[img(@"bgImage")CGImage];
    UIButton *(^newb)(MASViewAttribute *,CGFloat gap,NSString *)=^(MASViewAttribute *mas,CGFloat gap,NSString *img){
        UIButton *b=[NoHLBtn buttonWithType:UIButtonTypeCustom];
        [self addSubview:b];
        [b mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self).multipliedBy(.7);
            make.height.equalTo(self).multipliedBy(.1);
            make.centerX.equalTo(@0);
            if(mas)
                make.bottom.equalTo(mas).offset(gap);
        }];
        b.adjustsImageWhenHighlighted=NO;
        [b setBackgroundImage:img(img) forState:UIControlStateNormal];
        [b setBackgroundImage:img(([NSString stringWithFormat:@"%@Selected",img ])) forState:UIControlStateSelected];
        [b addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        return b;
    };
    self.setting=newb(self.mas_bottom,0,@"seting");
    self.message=newb(self.setting.mas_top,0,@"message");
    self.wechat=newb(self.message.mas_top,-20,@"weixin");
    self.sina=newb(self.wechat.mas_top,-15,@"sina");
    self.login=newb(self.sina.mas_top,-10,@"unLogin");
    self.discovery=newb(self.login.mas_top,-20,@"found");
    self.home=newb(self.discovery.mas_top,0,@"home");
    
    
    self.city=[CityBtn buttonWithType:0];
    self.city.adjustsImageWhenHighlighted=NO;
    [self.city setBackgroundColor:[UIColor blackColor]];
   
    
    [self addSubview:self.city];
    [self.city mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self).multipliedBy(.7);
        make.height.equalTo(self).multipliedBy(.1);
        make.centerX.equalTo(@0);
        make.top.equalTo(@5);
    }];
    
    self.city.layer.masksToBounds=YES;
    self.city.layer.cornerRadius=8;
    [self.city setTitle:@"北京" forState:UIControlStateNormal];
    [self.city setTitleColor:iGolbalGreen forState:UIControlStateNormal];
    [self.city setImage:img(@"city_down") forState:UIControlStateNormal];
    [self.city setImage:img(@"city_up") forState:UIControlStateSelected];
    [self.city addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchDown];
    self.home.tag=LeftButtonTypeHome;
    self.discovery.tag=LeftButtonTypeFound;
    self.login.tag=LeftButtonTypeIcon;
    self.sina.tag=LeftButtonTypeSina;
    self.wechat.tag=LeftButtonTypeWeixin;
    self.message.tag=LeftButtonTypeMessage;
    self.setting.tag=LeftButtonTypeSetting;
    
    

    
    UIImageView *sep1=[[UIImageView alloc] initWithImage:img(@"blackLine")];
    [self addSubview:sep1];
    [sep1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@-14);
        make.leading.equalTo(@-6);
        make.height.equalTo(@22);
        make.top.equalTo(self.discovery.mas_bottom).offset(5);
    }];
    UIImageView *sep2=[[UIImageView alloc] initWithImage:img(@"blackLine")];
    [self addSubview:sep2];
    [sep2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@-14);
        make.leading.equalTo(@-6);
        make.height.equalTo(@22);
        make.top.equalTo(self.wechat.mas_bottom).offset(12);
    }];
    
    [self insertSubview:self.city atIndex:self.subviews.count-1];
}



@end


@implementation NoHLBtn

-(void)setHighlighted:(BOOL)highlighted{

}

@end

@implementation CityBtn

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.x=self.w*.5+20;
    self.titleLabel.x=self.w*.5-20;
}

@end
