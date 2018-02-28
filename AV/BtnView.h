//
//  BtnView.h
//  AV
//
//  Created by ZZCN77 on 2017/9/22.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, KeyType){
    //按键类型
    upBtnType = 1,
    mdBtnType,
    dwBtnKey,
    nilBtnKey,
    
    dongBtnType,
    nanBtnType,
    xiBtnType,
    beiBtnType,
    
    oneBtnType,
    twoBtnType,
    thressBtnType,
    zhongBtnKey,
    
    fourBtnType,
    fiveBtnType,
    sixBtnType,
    faBtnType,
    
    sevenBtnType,
    eightBtnType,
    nineBtnType,
    baiBtnType,

    
    tiaoBtnType,
    tongBtnType,
    wanBtnType,
    
};

@interface BtnView : UIView
@property(strong, nonatomic) UIButton *upBtn;
@property(strong, nonatomic) UIButton *mdBtn;
@property(strong, nonatomic) UIButton *dwBtn;
@property(strong, nonatomic) UIButton *nilBtn;

@property(strong, nonatomic) UIButton *oneBtn;
@property(strong, nonatomic) UIButton *twoBtn;
@property(strong, nonatomic) UIButton *thressBtn;
@property(strong, nonatomic) UIButton *zhongBtn;

@property(strong, nonatomic) UIButton *fourBtn;
@property(strong, nonatomic) UIButton *fiveBtn;
@property(strong, nonatomic) UIButton *sixBtn;
@property(strong, nonatomic) UIButton *faBtn;

@property(strong, nonatomic) UIButton *sevenBtn;
@property(strong, nonatomic) UIButton *eightBtn;
@property(strong, nonatomic) UIButton *nineBtn;
@property(strong, nonatomic) UIButton *baiBtn;

@property(strong, nonatomic) UIButton *dongBtn;
@property(strong, nonatomic) UIButton *nanBtn;
@property(strong, nonatomic) UIButton *xiBtn;
@property(strong, nonatomic) UIButton *beiBtn;

@property(strong, nonatomic) UIButton *tiaoBtn;
@property(strong, nonatomic) UIButton *tongBtn;
@property(strong, nonatomic) UIButton *wanBtn;
- (instancetype)initWithArray:(NSArray *)array frame:(CGRect)frame;

@end
