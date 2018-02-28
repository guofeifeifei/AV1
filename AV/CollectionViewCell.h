//
//  CollectionViewCell.h
//  AV
//
//  Created by ZZCN77 on 2017/9/22.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <UIKit/UIKit.h>
/******* 屏幕尺寸 *******/
#define KMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define KMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define GFMainScreenBounds [UIScreen mainScreen].bounds

#define widthScale KMainScreenWidth / 375.0
#define heightScale KMainScreenHeight / 667.0
#define K6TextColor [UIColor colorWithRed:(102) / 255.0 green:(102) / 255.0  blue:(102) / 255.0  alpha:1.0]

/******* 屏幕尺寸 *******/
@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *titleLb ;
@property (nonatomic,strong) UIView *bgView  ;

@end
