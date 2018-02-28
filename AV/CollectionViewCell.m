//
//  CollectionViewCell.m
//  AV
//
//  Created by ZZCN77 on 2017/9/22.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    self.backgroundColor = RGBA(102, 102, 102, 1.0);
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,(KMainScreenWidth)/5 -1, (KMainScreenHeight-200 ) / 6 - 1)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgView];

    self.titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0 * widthScale, 0* widthScale,(KMainScreenWidth)/5 , (KMainScreenHeight-200 ) / 6 - 1)];
    self.titleLb.textAlignment = 1 ;
    self.titleLb.font = [UIFont systemFontOfSize:20];
    self.titleLb.textColor = K6TextColor;
    [self addSubview:self.titleLb];


}
@end
