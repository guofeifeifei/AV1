//
//  ShockViewController.m
//  AV
//
//  Created by ZZCN77 on 2017/9/23.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "ShockViewController.h"
#import "BtnTwoView.h"
#import "GFProgressHUD.h"
#import <Hyphenate/EMClient.h>
#import "BtnThressView.h"
#import "ShockTwoViewController.h"
@interface ShockViewController ()<EMClientDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) BtnTwoView *btnView;
@end

@implementation ShockViewController
-(long int)getRandomNumber:(long int)from to:(long int)to
{
    return (long int)(from + (arc4random() % (to - from + 1)));
}
- (void)backAction{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)gotoAction{
    ShockTwoViewController *shockTwoVC =[[ShockTwoViewController alloc] init];
    shockTwoVC.acountStr = self.acountStr;
    [self presentViewController:shockTwoVC animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0,100, 200);
    backBtn.backgroundColor = [UIColor blackColor];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *gotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gotoBtn.frame = CGRectMake(KMainScreenWidth - 100, 0,100, 200);
    gotoBtn.backgroundColor = [UIColor blackColor];
    [gotoBtn addTarget:self action:@selector(gotoAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gotoBtn];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.btnView];

    
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20 * widthScale, 150 * widthScale,KMainScreenWidth - 22 * widthScale, 40 * widthScale)];
//    lable.textAlignment = 2;
//    lable.text = self.acountStr;
//    lable.textColor = K6TextColor;
//    lable.font = [UIFont systemFontOfSize:24 * widthScale];
//    [self.view addSubview:lable];
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if ([user objectForKey:@"serverUser"] == nil) {
      NSString  *serverUser =[NSString stringWithFormat:@"%ld",  [self getRandomNumber:1000 to:100000]];
        EMError *error = [[EMClient sharedClient] registerWithUsername:serverUser password:serverUser];
        if (error == nil) {
            NSLog(@"注册成功");
            [user setValue:serverUser forKey:@"serverUser"];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [GFProgressHUD showMessagewithoutView:@"注册失败成功， 请重新注册" afterDelay:2];
            });
        }

    }
    
    //登录
    EMError *error = [[EMClient sharedClient] loginWithUsername:[user objectForKey:@"serverUser"] password:[user objectForKey:@"serverUser"]];
    if (!error) {
        NSLog(@"登录成功");
        dispatch_async(dispatch_get_main_queue(), ^{
            [GFProgressHUD showMessagewithoutView:@"登录成功" afterDelay:2];
            
        });
        NSLog(@"%@", [user objectForKey:@"serverUser"]);
        //自动登录
        //[[EMClient sharedClient].options setIsAutoLogin:YES];
    }
    else {
        if (error.code != 200) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [GFProgressHUD showMessagewithoutView:@"登录失败" afterDelay:2];
                
            });
            NSLog(@"登录失败，请重新登录:%@", error.errorDescription);
        }
        NSLog(@"登录失败，请重新登录:%@", error.errorDescription);
        
    }

    
}
- (void)btnAction:(UIButton *)btn{
    switch (btn.tag) {
        case oneType:
        {
            [self sendMessage:@"cmd_1"];
        }
            
            break;
        case twoType:
        {
            [self sendMessage:@"cmd_2"];
        }
            
            break;
        case thressType:
        {
            [self sendMessage:@"cmd_3"];
        }
            
            break;
  
        case fourType:
        {
            [self sendMessage:@"cmd_4"];
        }
            
            break;
        case fiveType:
        {
            [self sendMessage:@"cmd_5"];
        }
            
            break;
        case sixType:
        {
            [self sendMessage:@"cmd_6"];
        }
            
            break;
 
        case sevenType:
        {
            [self sendMessage:@"cmd_7"];
        }
            
            break;
        case eightType:{
            [self sendMessage:@"cmd_8"];
        }
            
            break;
        case nineType:{
            [self sendMessage:@"cmd_9"];
        }
            
  
        default:
            break;
    }
}
- (void)sendMessage:(NSString *)messageStr {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if ([user objectForKey:@"serverUser"] == nil) {
            NSLog(@"%@", messageStr);
        return;
    }
    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:messageStr];
    NSString *from = [[EMClient sharedClient] currentUsername];
    

    
    //生成Message
    EMMessage *message = [[EMMessage alloc] initWithConversationID:[user objectForKey:@"serverUser"] from:from to:self.acountStr body:body ext:nil];
    message.chatType = EMChatTypeChat;// 设置为单聊消息
    //发送
    [[EMClient sharedClient].chatManager sendMessage:message progress:nil completion:^(EMMessage *message, EMError *error) {
        if (!error) {
                NSLog(@"%@", messageStr);

        }else{
            
            NSLog(@"登录失败，请重新登录:%@", error.errorDescription);
            
        }
    }];
    
  }
//重连
- (void)connectionStateDidChange:(EMConnectionState)aConnectionState{
    
}
/*!
 *  当前登录账号在其它设备登录时会接收到该回调
 */
- (void)userAccountDidLoginFromOtherDevice{

}

/*!
 *  当前登录账号已经被从服务器端删除时会收到该回调
 */
- (void)userAccountDidRemoveFromServer{
  
}


- (BtnTwoView *)btnView{
    if (_btnView == nil) {
        self.btnView = [[BtnTwoView alloc] initWithFrame:CGRectMake(0, 200 * widthScale, KMainScreenWidth - 0, KMainScreenHeight-200 * widthScale)];
        self.btnView.backgroundColor = [UIColor blackColor];
        [self.btnView.oneBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView.twoBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView.thressBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btnView.fourBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView.fiveBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView.sixBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btnView.sevenBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView.eightBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView.nineBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
        
        
        
        
    }
    return _btnView;
}



@end
