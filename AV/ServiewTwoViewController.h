//
//  ServiewTwoViewController.h
//  AV
//
//  Created by ZZCN77 on 2017/9/25.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define KMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define KMainScreenBounds [UIScreen mainScreen].bounds

#define widthScale KMainScreenWidth / 375.0
#define heightScale KMainScreenHeight / 667.0
#define K6TextColor [UIColor colorWithRed:(196.0) / 255.0 green:(102.0) / 255.0  blue:(20.0) / 255.0  alpha:1.0]
@interface ServiewTwoViewController : UIViewController
@property (nonatomic, strong) NSString *acountStr;

@end
