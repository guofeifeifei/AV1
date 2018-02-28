//
//  MainViewController.m
//  AV
//
//  Created by ZZCN77 on 2017/9/22.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "MainViewController.h"
#import "GFProgressHUD.h"
#import "ShockViewController.h"
#import "ServiewTwoViewController.h"
#import "KeyMd5.h"
@interface MainViewController (){
    NSString *_userID;
}


@end

@implementation MainViewController
- (IBAction)addUser:(id)sender {
    
    //提示框添加文本输入框
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         //响应事件
                                                         //得到文本信息
                                                         for (UITextField *textfile in alert.textFields) {
                                                             NSLog(@"%@", textfile.text);
                                                             _userID = textfile.text;
                                                         }
                                                          
                                                         
                                                     }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                           
                                                             
                                                         }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入ID";
        textField.textAlignment = 1;
    }];
    
    
    
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];

                               
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _userID = @"";
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14 * widthScale] ,NSForegroundColorAttributeName:[UIColor whiteColor]};
  
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if ([user objectForKey:@"username"] != nil) {
        _userID =[user objectForKey:@"username"];
    }else{
      
        [GFProgressHUD showMessagewithoutView:@"请输入被控制方ID" afterDelay:2];
  
    }
    
    
    NSString *deviceUUID = [[[[UIDevice currentDevice] identifierForVendor] UUIDString] lowercaseString];
    NSString *subString33 = [deviceUUID substringWithRange:NSMakeRange(deviceUUID.length - 6, 6)];
    NSLog(@"%@", subString33);
    NSString *str = [KeyMd5 md5HexDigest:[KeyMd5 md5HexDigest:subString33]];
    NSString *zhuceStr =[str substringWithRange:NSMakeRange(str.length - 6, 6)];
    if (![zhuceStr isEqualToString:[user valueForKey:@"zhucema"]]) {

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0*NSEC_PER_MSEC)),dispatch_get_main_queue(), ^{
        
        //提示框添加文本输入框
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:[NSString stringWithFormat:@"您的特征码为：%@", subString33]
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             //得到文本信息
                                                             for (UITextField *textfile in alert.textFields) {
                                                                 NSLog(@"%@", textfile.text);
                                                           
                                                             
                                                                 if (![zhuceStr isEqualToString: textfile.text]) {
                                                                     [GFProgressHUD showMessagewithoutView:@"输入的注册码不对" afterDelay:2];
                                                                      [self presentViewController:alert animated:YES completion:nil];
                                                                 }else{
                                                                    [self dismissViewControllerAnimated:YES completion:nil];
                                                                     NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                                                                     
                                                                     [user setObject:textfile.text forKey:@"zhucema"];
                                                                 }
                                                             }

                                                         }];
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 exit(0);

                                                             }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"请输入新的注册码";
            textField.textAlignment = 1;
        }];
        
        
       
        [alert addAction:cancelAction];
         [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    });
    }
}

- (IBAction)shockBtn:(id)sender {
    if (_userID.length == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [GFProgressHUD showMessagewithoutView:@"请输入被控方账号" afterDelay:2];
        });
        return ;

    }
    
      NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
     [user setValue:_userID forKey:@"username"];
    ShockViewController *shock = [[ShockViewController alloc] init];
    shock.acountStr = _userID;
    [self presentViewController:shock animated:NO completion:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    }];
}
- (IBAction)voiceBtn:(id)sender {
    if (_userID.length == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [GFProgressHUD showMessagewithoutView:@"请输入被控方账号" afterDelay:2];
          

        });
          return ;
    }
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:_userID forKey:@"username"];
    ServiewTwoViewController *server = [[ServiewTwoViewController alloc] init];
    server.acountStr = _userID;
    [self presentViewController:server animated:NO completion:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    }];
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
