//
//  ShockTwoViewController.m
//  AV
//
//  Created by ZZCN77 on 2017/9/29.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "ShockTwoViewController.h"
#import "GFProgressHUD.h"
#import <Hyphenate/EMClient.h>
#import "BtnThressView.h"
@interface ShockTwoViewController ()
@property (nonatomic, strong) BtnThressView *btnTwoView;

@end

@implementation ShockTwoViewController
- (void)backAction{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0,100, 200);
    backBtn.backgroundColor = [UIColor blackColor];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    [self.view addSubview:self.btnTwoView];
  NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
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
   
    [self sendMessage:[NSString stringWithFormat:@"cmd_%@", btn.titleLabel.text]];
    
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


- (BtnThressView *)btnTwoView{
    if (_btnTwoView == nil) {
        self.btnTwoView = [[BtnThressView  alloc] initWithFrame:CGRectMake(0, 100 * widthScale, KMainScreenWidth - 0, KMainScreenHeight - 100 * widthScale)];
        self.btnTwoView.backgroundColor = [UIColor blackColor];
        [self.btnTwoView.oneBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnTwoView.twoBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnTwoView.thressBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btnTwoView.fourBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnTwoView.fiveBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnTwoView.sixBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btnTwoView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
