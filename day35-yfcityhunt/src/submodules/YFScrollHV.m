
//
//  YFScrollHV.m
//  day35-yfcityhunt
//
//  Created by apple on 15/11/17.
//  Copyright (c) 2015年 yf. All rights reserved.
//

#import "YFScrollHV.h"
#import "UIImageView+WebCache.h"
@interface YFScrollHV()<UIScrollViewDelegate>

@property (nonatomic,strong)UIPageControl *pc;
@property (nonatomic,strong)UIScrollView *sv;



@end

@implementation YFScrollHV
- (instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        self.sv=[[UIScrollView alloc] initWithFrame:frame];
        self.sv.pagingEnabled=YES;
        self.sv.showsHorizontalScrollIndicator=NO;
        self.sv.showsVerticalScrollIndicator=NO;
        self.sv.delegate=self;
        [self addSubview:self.sv];
        self.pc=[[UIPageControl alloc] init];
        [self addSubview:self.pc];
        self.pc.cx=self.icx;
        self.pc.b=self.h-20;
        [self.pc setHidesForSinglePage:YES];
        
        self.nav=[[UIView alloc] initWithFrame:(CGRect){0,0,self.w,self.h}];
        self.nav.backgroundColor=iGolbalGreen;
        self.nav.alpha=0;
        [self insertSubview:self.nav aboveSubview:self.pc];
        
    }
    return self;
}
-(void)setImgs:(NSArray *)imgs{
    _imgs=imgs;
    int i=0;
    CGFloat w=self.w;
    for(NSString *url in imgs){
        UIImageView *iv=[[UIImageView alloc] initWithFrame:(CGRect){i*w,0,self.size}];
        [self.sv addSubview:iv];
        [iv sd_setImageWithURL:iURL(url) placeholderImage:img(@"ImageLodingFailed_6P")];
        i++;
    }
    
    if(imgs.count<=1) return ;
    [self.pc setNumberOfPages:imgs.count];
    self.sv.contentSize=(CGSize){w*imgs.count,0};
    self.nav.w=self.w*imgs.count;
}

-(void)scroll:(CGRect)rect hvh:(CGFloat)h{
    self.nav.y=rect.origin.y;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pc.currentPage=scrollView.contentOffset.x/self.w;
}

@end
