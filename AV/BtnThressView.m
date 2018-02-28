//
//  BtnThressView.m
//  AV
//
//  Created by ZZCN77 on 2017/9/29.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "BtnThressView.h"
#define KbgColor [UIColor clearColor]

#define K6TextColor [UIColor clearColor]
/******* 屏幕尺寸 *******/
#define KMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define KMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define KMainScreenBounds [UIScreen mainScreen].bounds

#define widthScale KMainScreenWidth / 375.0
#define heightScale KMainScreenHeight / 667.0
#define btnwidth (self.bounds.size.width - 2) / 3
#define btnheight (self.bounds.size.height - 1) / 2
@interface BtnThressView()
@property (nonatomic, strong) NSArray *array;

@end
@implementation BtnThressView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.array = @[
                       @"1",@"2",@"3",
                       @"4",@"5",@"6",
                    
                       ];
        [self creatView];
    }
    
    return self;
}
- (void)creatView{
    
    
    [self addSubview:self.oneBtn];
    [self addSubview:self.twoBtn];
    [self addSubview:self.thressBtn];
    
    [self addSubview:self.fourBtn];
    [self addSubview:self.fiveBtn];
    [self addSubview:self.sixBtn];

    
}
- (UIButton *)oneBtn{
    if (_oneBtn == nil) {
        self.oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.oneBtn.frame = CGRectMake(0 ,0 , btnwidth, btnheight );
        [self.oneBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.oneBtn.backgroundColor = KbgColor;
        [self.oneBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [self.oneBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateHighlighted];
        self.oneBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
     //   self.oneBtn.tag = oneType;
        [self.oneBtn setTitle:self.array[0] forState:UIControlStateNormal];
        
    }
    return _oneBtn;
}
- (UIButton *)twoBtn{
    if (_twoBtn == nil) {
        self.twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.twoBtn.frame = CGRectMake(1 + btnwidth, 0 , btnwidth, btnheight );
        [self.twoBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.twoBtn.backgroundColor = KbgColor;
        [self.twoBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [self.twoBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateHighlighted];
        self.twoBtn.titleLabel.font = [UIFont systemFontOfSize:20];
       // self.twoBtn.tag = twoType;
        [self.twoBtn setTitle:self.array[1] forState:UIControlStateNormal];
        
    }
    return _twoBtn;
}
- (UIButton *)thressBtn{
    if (_thressBtn == nil) {
        self.thressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.thressBtn.frame = CGRectMake(2 + btnwidth * 2, 0 , btnwidth, btnheight );
        [self.thressBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.thressBtn.backgroundColor = KbgColor;
        [self.thressBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [self.thressBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateHighlighted];
        self.thressBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        //self.thressBtn.tag = thressType;
        [self.thressBtn setTitle:self.array[2] forState:UIControlStateNormal];
    }
    return _thressBtn;
}
- (UIButton *)fourBtn{
    if (_fourBtn == nil) {
        self.fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.fourBtn.frame = CGRectMake(0 + btnwidth * 0, 1 + btnheight * 1 , btnwidth, btnheight );
        [self.fourBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [self.fourBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateHighlighted];
        [self.fourBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.fourBtn.backgroundColor = KbgColor;
        self.fourBtn.titleLabel.font = [UIFont systemFontOfSize:20];
       // self.fourBtn.tag = fourType;
        [self.fourBtn setTitle:self.array[3] forState:UIControlStateNormal];
        
    }
    return _fourBtn;
}
- (UIButton *)fiveBtn{
    if (_fiveBtn == nil) {
        self.fiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.fiveBtn.frame = CGRectMake(1 + btnwidth * 1, 1 + btnheight * 1 , btnwidth, btnheight );
        [self.fiveBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [self.fiveBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateHighlighted];
        [self.fiveBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.fiveBtn.backgroundColor = KbgColor;
        self.fiveBtn.titleLabel.font = [UIFont systemFontOfSize:20];
      // self.fiveBtn.tag = fiveType;
        [self.fiveBtn setTitle:self.array[4] forState:UIControlStateNormal];
        
        
    }
    return _fiveBtn;
}

- (UIButton *)sixBtn{
    if (_sixBtn == nil) {
        self.sixBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sixBtn.frame = CGRectMake(2 + btnwidth * 2, 1 + btnheight * 1  , btnwidth, btnheight );
        [self.sixBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [self.sixBtn setBackgroundImage:[UIImage imageNamed:@"btnbg.png"] forState:UIControlStateHighlighted];
        [self.sixBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.sixBtn.backgroundColor = KbgColor;
        self.sixBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        //self.sixBtn.tag = sixType;
        [self.sixBtn setTitle:self.array[5] forState:UIControlStateNormal];
    }
    return _sixBtn;
}
@end
