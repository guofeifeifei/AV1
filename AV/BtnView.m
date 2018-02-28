//
//  BtnView.m
//  AV
//
//  Created by ZZCN77 on 2017/9/22.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "BtnView.h"
#define K6TextColor [UIColor colorWithRed:(196.0) / 255.0 green:(102.0) / 255.0  blue:(20.0) / 255.0  alpha:1.0]
#define KbgColor [UIColor colorWithRed:(153) / 255.0 green:(153) / 255.0  blue:(153) / 255.0  alpha:0.5]
/******* 屏幕尺寸 *******/
#define KMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define KMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define KMainScreenBounds [UIScreen mainScreen].bounds

#define widthScale KMainScreenWidth / 375.0
#define heightScale KMainScreenHeight / 667.0
#define btnwidth (self.frame.size.width - 2) / 4
#define btnwidth2 (self.frame.size.width - 3) / 3
#define btnheight (self.frame.size.height - 6) / 6
#define KTColor [UIColor colorWithRed:(196.0) / 255.0 green:(102.0) / 255.0  blue:(20.0) / 255.0  alpha:1.0]

/******* 屏幕尺寸 *******/
@interface BtnView()
@property (nonatomic, strong) NSArray *array;

@end
@implementation BtnView
- (instancetype)initWithArray:(NSArray *)array frame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.frame =frame;

        self.array = array;
        [self creatView];
    }
    
    return self;

    
}

- (void)creatView{
    
    [self addSubview:self.upBtn];
    [self addSubview:self.mdBtn];
    [self addSubview:self.dwBtn];
    [self addSubview:self.oneBtn];
    [self addSubview:self.twoBtn];
    
    [self addSubview:self.thressBtn];
    [self addSubview:self.zhongBtn];
    [self addSubview:self.nilBtn];
    [self addSubview:self.fourBtn];
    [self addSubview:self.fiveBtn];
    
    [self addSubview:self.sixBtn];
    [self addSubview:self.faBtn];
    [self addSubview:self.sevenBtn];
    [self addSubview:self.eightBtn];
    [self addSubview:self.nineBtn];
    [self addSubview:self.baiBtn];
    
    [self addSubview:self.dongBtn];
    [self addSubview:self.nanBtn];
    [self addSubview:self.xiBtn];
    [self addSubview:self.beiBtn];

    [self addSubview:self.tiaoBtn];
    [self addSubview:self.tongBtn];
    [self addSubview:self.wanBtn];


}
- (UIButton *)upBtn{
    if (_upBtn == nil) {
        self.upBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.upBtn.frame = CGRectMake(1 , 1 , btnwidth, btnheight );
        [self.upBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.upBtn.backgroundColor = KbgColor;
        self.upBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        self.upBtn.tag = upBtnType;
        [self.upBtn setTitle:self.array[0] forState:UIControlStateNormal];

    }
    return _upBtn;
}
- (UIButton *)mdBtn{
    if (_mdBtn == nil) {
        self.mdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mdBtn.frame = CGRectMake(2  + btnwidth, 1, btnwidth, btnheight );
        [self.mdBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.mdBtn.backgroundColor = KbgColor;
        self.mdBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        self.mdBtn.tag = mdBtnType;
        [self.mdBtn setTitle:self.array[1] forState:UIControlStateNormal];

    }
    return _mdBtn;
}
- (UIButton *)dwBtn{
    if (_dwBtn == nil) {
        self.dwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.dwBtn.frame = CGRectMake(3  + btnwidth * 2, 1, btnwidth, btnheight );
        [self.dwBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.dwBtn.backgroundColor = KbgColor;
        self.dwBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        self.dwBtn.tag = dwBtnKey;
        [self.dwBtn setTitle:self.array[2] forState:UIControlStateNormal];

    }
    return _dwBtn;
}
- (UIButton *)nilBtn{
    if (_nilBtn == nil) {
        self.nilBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nilBtn.frame = CGRectMake(4  + btnwidth * 3, 1, btnwidth, btnheight );
        [self.nilBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.nilBtn.backgroundColor = KbgColor;
        self.nilBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        self.nilBtn.tag = nilBtnKey;
        [self.nilBtn setTitle:self.array[3] forState:UIControlStateNormal];
   
    }
    return _nilBtn;
}
- (UIButton *)dongBtn{
    if (_dongBtn == nil) {
        self.dongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.dongBtn.frame = CGRectMake(1 + btnwidth * 0, 2 + btnheight * 1 , btnwidth, btnheight );
        [self.dongBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.dongBtn.backgroundColor = KbgColor;
        self.dongBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.dongBtn.tag = dongBtnType;
        [self.dongBtn setTitle:self.array[4] forState:UIControlStateNormal];
        
    }
    return _dongBtn;
}
- (UIButton *)nanBtn{
    if (_nanBtn == nil) {
        self.nanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nanBtn.frame = CGRectMake(2 + btnwidth * 1, 2 + btnheight * 1 , btnwidth, btnheight );
        [self.nanBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.nanBtn.backgroundColor = KbgColor;
        self.nanBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.nanBtn.tag = nanBtnType;
        [self.nanBtn setTitle:self.array[5] forState:UIControlStateNormal];
        
    }
    return _nanBtn;
}
- (UIButton *)xiBtn{
    if (_xiBtn == nil) {
        self.xiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.xiBtn.frame = CGRectMake(3 + btnwidth * 2, 2 + btnheight * 1 , btnwidth, btnheight );
        [self.xiBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.xiBtn.backgroundColor = KbgColor;
        self.xiBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.xiBtn.tag = xiBtnType;
        [self.xiBtn setTitle:self.array[6] forState:UIControlStateNormal];
    }
    return _xiBtn;
}
- (UIButton *)beiBtn{
    if (_beiBtn == nil) {
        self.beiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.beiBtn.frame = CGRectMake(4 + btnwidth *3, 2 + btnheight * 1 , btnwidth, btnheight );
        [self.beiBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.beiBtn.backgroundColor = KbgColor;
        self.beiBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.beiBtn.tag = beiBtnType;
        [self.beiBtn setTitle:self.array[7] forState:UIControlStateNormal];
        
    }
    return _beiBtn;
}
- (UIButton *)oneBtn{
    if (_oneBtn == nil) {
        self.oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.oneBtn.frame = CGRectMake(1 , 3 + btnheight * 2 ,btnwidth, btnheight );
        [self.oneBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.oneBtn.backgroundColor = KbgColor;
        self.oneBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        self.oneBtn.tag = oneBtnType;
        [self.oneBtn setTitle:self.array[8] forState:UIControlStateNormal];
 
    }
    return _oneBtn;
}
- (UIButton *)twoBtn{
    if (_twoBtn == nil) {
        self.twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.twoBtn.frame = CGRectMake(2 + btnwidth, 3+ btnheight * 2, btnwidth , btnheight );
        [self.twoBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.twoBtn.backgroundColor = KbgColor;
        self.twoBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        self.twoBtn.tag = twoBtnType;
        [self.twoBtn setTitle:self.array[9] forState:UIControlStateNormal];

    }
    return _twoBtn;
}
- (UIButton *)thressBtn{
    if (_thressBtn == nil) {
        self.thressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.thressBtn.frame = CGRectMake(3 + btnwidth * 2, 3 + btnheight * 2, btnwidth, btnheight );
        [self.thressBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.thressBtn.backgroundColor = KbgColor;
        self.thressBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        self.thressBtn.tag = thressBtnType;
        [self.thressBtn setTitle:self.array[10] forState:UIControlStateNormal];
    }
    return _thressBtn;
}
- (UIButton *)zhongBtn{
    if (_zhongBtn == nil) {
        self.zhongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.zhongBtn.frame = CGRectMake(4 + btnwidth * 3, 3 + btnheight * 2, btnwidth, btnheight );
        [self.zhongBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.zhongBtn.backgroundColor = KbgColor;
        self.zhongBtn.titleLabel.font = [UIFont systemFontOfSize:20  ];
        self.zhongBtn.tag = zhongBtnKey;
        [self.zhongBtn setTitle:self.array[11] forState:UIControlStateNormal];

    }
    return _zhongBtn;
}
- (UIButton *)fourBtn{
    if (_fourBtn == nil) {
        self.fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.fourBtn.frame = CGRectMake(1 + btnwidth * 0, 4 + btnheight * 3 , btnwidth, btnheight );
        [self.fourBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.fourBtn.backgroundColor = KbgColor;
        self.fourBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.fourBtn.tag = fourBtnType;
        [self.fourBtn setTitle:self.array[12] forState:UIControlStateNormal];

    }
    return _fourBtn;
}
- (UIButton *)fiveBtn{
    if (_fiveBtn == nil) {
        self.fiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.fiveBtn.frame = CGRectMake(2 + btnwidth * 1, 4 +  btnheight * 3  , btnwidth, btnheight );
        [self.fiveBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.fiveBtn.backgroundColor = KbgColor;
        self.fiveBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.fiveBtn.tag = fiveBtnType;
        [self.fiveBtn setTitle:self.array[13] forState:UIControlStateNormal];
        

    }
    return _fiveBtn;
}

- (UIButton *)sixBtn{
    if (_sixBtn == nil) {
        self.sixBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sixBtn.frame = CGRectMake(3 + btnwidth * 2, 4 +  btnheight * 3  , btnwidth, btnheight );
        [self.sixBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.sixBtn.backgroundColor = KbgColor;
        self.sixBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.sixBtn.tag = sixBtnType;
        [self.sixBtn setTitle:self.array[14] forState:UIControlStateNormal];
    }
    return _sixBtn;
}
- (UIButton *)faBtn{
    if (_faBtn == nil) {
        self.faBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.faBtn.frame = CGRectMake(4 + btnwidth * 3, 4 +  btnheight * 3  , btnwidth, btnheight );
        [self.faBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.faBtn.backgroundColor = KbgColor;
        self.faBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.faBtn.tag = faBtnType;
        [self.faBtn setTitle:self.array[15] forState:UIControlStateNormal];
    }
    return _faBtn;
}
- (UIButton *)sevenBtn{
    if (_sevenBtn == nil) {
        self.sevenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sevenBtn.frame = CGRectMake(1 + btnwidth * 0, 5 +  btnheight * 4  , btnwidth, btnheight );
        [self.sevenBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.sevenBtn.backgroundColor = KbgColor;
        self.sevenBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.sevenBtn.tag = sevenBtnType;
        [self.sevenBtn setTitle:self.array[16] forState:UIControlStateNormal];
    }
    return _sevenBtn;
}
- (UIButton *)eightBtn{
    if (_eightBtn == nil) {
        self.eightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.eightBtn.frame = CGRectMake(2 + btnwidth * 1, 5 + btnheight * 4 , btnwidth, btnheight );
        [self.eightBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.eightBtn.backgroundColor = KbgColor;
        self.eightBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.eightBtn.tag = eightBtnType;
        [self.eightBtn setTitle:self.array[17] forState:UIControlStateNormal];

    }
    return _eightBtn;
}
- (UIButton *)nineBtn{
    if (_nineBtn == nil) {
        self.nineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nineBtn.frame = CGRectMake(3 + btnwidth * 2, 5 + btnheight * 4 , btnwidth, btnheight );
        [self.nineBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.nineBtn.backgroundColor = KbgColor;
        self.nineBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.nineBtn.tag = nineBtnType;
        [self.nineBtn setTitle:self.array[18] forState:UIControlStateNormal];
    }
    return _nineBtn;
}
- (UIButton *)baiBtn{
    if (_baiBtn == nil) {
        self.baiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.baiBtn.frame = CGRectMake(4 + btnwidth * 3,  5 + btnheight * 4 , btnwidth, btnheight );
        [self.baiBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.baiBtn.backgroundColor = KbgColor;
        self.baiBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.baiBtn.tag = baiBtnType;
        [self.baiBtn setTitle:self.array[19] forState:UIControlStateNormal];

    }
    return _baiBtn;
}

- (UIButton *)tiaoBtn{
    if (_tiaoBtn == nil) {
        self.tiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.tiaoBtn.frame = CGRectMake(1 + btnwidth2 *0, 6 + btnheight * 5 , btnwidth2, btnheight );
        [self.tiaoBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.tiaoBtn.backgroundColor = KbgColor;
        self.tiaoBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.tiaoBtn.tag = tiaoBtnType;
        [self.tiaoBtn setTitle:self.array[20] forState:UIControlStateNormal];
    }
    return _tiaoBtn;
}
- (UIButton *)tongBtn{
    if (_tongBtn == nil) {
        self.tongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.tongBtn.frame = CGRectMake(2 + btnwidth2 *1, 6 + btnheight * 5 , btnwidth2, btnheight );
        [self.tongBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
        self.tongBtn.backgroundColor = KbgColor;
        self.tongBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        self.tongBtn.tag = tongBtnType;
        [self.tongBtn setTitle:self.array[21] forState:UIControlStateNormal];
    }
    return _tongBtn;
}
- (UIButton *)wanBtn{
 if (_wanBtn == nil) {
     self.wanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     self.wanBtn.frame = CGRectMake(3 + btnwidth2 *2, 6 + btnheight * 5 , btnwidth2, btnheight );
     [self.wanBtn setTitleColor:K6TextColor forState:UIControlStateNormal];
     self.wanBtn.backgroundColor = KbgColor;
     self.wanBtn.titleLabel.font = [UIFont systemFontOfSize:20];
     self.wanBtn.tag = wanBtnType;
     [self.wanBtn setTitle:self.array[22] forState:UIControlStateNormal];
 }
    return _wanBtn;
}


@end
