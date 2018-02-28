//
//  ServiewTwoViewController.m
//  AV
//
//  Created by ZZCN77 on 2017/9/25.
//  Copyright © 2017年 ZZCN77. All rights reserved.
//

#import "ServiewTwoViewController.h"
#import <Hyphenate/EMClient.h>
#import "GFProgressHUD.h"
#import "CollectionViewCell.h"
#import "BDSSpeechSynthesizer.h"
@interface ServiewTwoViewController()<EMClientDelegate,UICollectionViewDataSource,UICollectionViewDelegate, BDSSpeechSynthesizerDelegate>{
    BOOL _selectStatus;
}
@property (strong, nonatomic) UICollectionView *collcetionView;
@property (strong, nonatomic) UICollectionView *collcetionViewRight;
@property (strong, nonatomic) NSArray *titleArray1;
@property (strong, nonatomic) NSArray *titleArray2;
@property (strong, nonatomic) NSArray *sendArray;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic, copy) NSString *sendMessage;
@property (nonatomic, copy) NSString *sendMessageOne;

@end

@implementation ServiewTwoViewController
-(long int)getRandomNumber:(long int)from to:(long int)to
{
    return (long int)(from + (arc4random() % (to - from + 1)));
}
- (void)backAction{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self configureOnlineTTS];
    //离线
    [self configureOfflineTTS];
    _selectStatus = NO;
    self.sendMessage= @"";
    self.sendMessageOne = @"";
    [self creatcollection];
    [self.view addSubview:self.scrollView];
//     UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20 * widthScale, 150 ,KMainScreenWidth - 22 * widthScale, 50 )];
//    lable.textAlignment = 2;
//    lable.text = self.acountStr;
//    lable.textColor = K6TextColor;
//    lable.font = [UIFont systemFontOfSize:24 * widthScale];
//    [self.view addSubview:lable];
//    
//    UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(20 * widthScale + KMainScreenWidth, 150 ,KMainScreenWidth - 22 * widthScale, 50 )];
//    lable2.textAlignment = 2;
//    lable2.text = self.acountStr;
//    lable2.textColor = K6TextColor;
//    lable2.font = [UIFont systemFontOfSize:24 * widthScale];
//    [self.view addSubview:lable2];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0,200, 200);
    backBtn.backgroundColor = [UIColor blackColor];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    UIButton *backBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn2.frame = CGRectMake(KMainScreenWidth, 0,200, 200);
    backBtn2.backgroundColor = [UIColor blackColor];
    [backBtn2 addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn2];
    
    self.titleArray1 = @[@"MC", @"M+", @"M-", @"MR", @"AC",
                         @"sun", @"x¹", @"x²", @"x³", @"+",
                         @"cos", @"1", @"2", @"3", @"-",
                          @"tan", @"4", @"5", @"6", @"x",
                          @"In", @"7", @"8", @"9", @"+",
                         @"Ig", @"0", @"00", @".", @"="];
    self.titleArray2 = @[@"东", @"南", @"西", @"北", @"AC",
                         @"中", @"发", @"白", @"财", @"打",
                         @"上", @"1", @"2", @"3", @"筒",
                         @"对", @"4", @"5", @"6", @"万",
                         @"下", @"7", @"8", @"9", @"条",
                         @"胡", @"碰", @"杠", @"吃", @""];
    //东：东风，南：南风，西：西风，北：北风
    //上：上家，对：对门，下：下家。
    //中：红中，发：发财，财：财神。
    self.sendArray =@[@"东风", @"南风", @"西风", @"北风", @"",
                      @"红中", @"发财", @"白板", @"财神", @"打",
                      @"上家", @"1", @"2", @"3", @"筒",
                      @"对门", @"4", @"5", @"6", @"万",
                      @"下家", @"7", @"8", @"9", @"条",
                      @"胡", @"碰", @"杠", @"吃", @""];
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
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
     CollectionViewCell *cell =(CollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    if ([cell.titleLb.text isEqualToString:@""]||
        [cell.titleLb.text isEqualToString:@"="]) {
        if (_selectStatus == YES) {
            _selectStatus = NO;
        }else{
        _selectStatus = YES;
        }
    }
    if (collectionView == _collcetionViewRight) {
    
    if ([cell.titleLb.text isEqualToString: @"东"]||
            [cell.titleLb.text isEqualToString:  @"南"]||
            [cell.titleLb.text isEqualToString:  @"西"]||
            [cell.titleLb.text isEqualToString:  @"北"]||
            [cell.titleLb.text isEqualToString: @"中"]||
            [cell.titleLb.text isEqualToString:  @"发"]||
            [cell.titleLb.text isEqualToString:  @"白"]||
            [cell.titleLb.text isEqualToString:  @"财"]||
            [cell.titleLb.text isEqualToString:  @"筒"]||
            [cell.titleLb.text isEqualToString:  @"万"]||
            [cell.titleLb.text isEqualToString:  @"条"] ||
            
            [cell.titleLb.text isEqualToString: @"MC"]||
            [cell.titleLb.text isEqualToString:  @"M+"]||
            [cell.titleLb.text isEqualToString:  @"M-"]||
            [cell.titleLb.text isEqualToString:  @"MR"]||
            [cell.titleLb.text isEqualToString: @"sun"]||
            [cell.titleLb.text isEqualToString:  @"x¹"]||
            [cell.titleLb.text isEqualToString:  @"x²"]||
            [cell.titleLb.text isEqualToString:  @"x³"]||
            [cell.titleLb.text isEqualToString:  @"-"]||
            [cell.titleLb.text isEqualToString:  @"x"]||
            [cell.titleLb.text isEqualToString:  @"+"]) {
            //发送
             self.sendMessage = [NSString stringWithFormat:@"%@ %@ ", self.sendMessage,self.sendArray[indexPath.row]];
            if (_selectStatus == NO) {
                [self sendMessage:self.sendMessage];
            }else{
                [self speakSentence:self.sendMessage];
                
            }
             self.sendMessage = @"";
        }else if ([cell.titleLb.text isEqualToString: @"AC"]){
            self.sendMessage = @"";
        }else{
            self.sendMessage = [NSString stringWithFormat:@"%@ %@ ", self.sendMessage,self.sendArray[indexPath.row]];
        }
    }
     if (collectionView == _collcetionView) {
        
        if ([cell.titleLb.text isEqualToString: @"1"]||
            [cell.titleLb.text isEqualToString:  @"2"]||
            [cell.titleLb.text isEqualToString:  @"3"]||
            [cell.titleLb.text isEqualToString:  @"4"]||
            [cell.titleLb.text isEqualToString: @"5"]||
            [cell.titleLb.text isEqualToString:  @"6"]||
            [cell.titleLb.text isEqualToString:  @"7"]||
            [cell.titleLb.text isEqualToString:  @"8"]||
            [cell.titleLb.text isEqualToString:  @"9"]){
            self.sendMessageOne = self.sendArray[indexPath.row];
            if (_selectStatus == NO) {
                [self sendMessage:self.sendMessageOne];
            }else{
                [self speakSentence:self.sendMessageOne];
                
            }
            self.sendMessageOne = @"";
        }
    }
   
}
- (void)creatcollection{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init] ;
    //设置collectionView的滑动方向
    //UICollectionViewScrollDirectionVertical 垂直滑动   默认滑动方向
    //UICollectionViewScrollDirectionHorizontal 水平滑动
    //    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //在垂直方向  设置的是cell上下之间的最小间距 在水平方向  设置的是cell左右之间的最小间距
    flowLayout.minimumLineSpacing = 0 ;
    //在垂直方向  设置的是cell左右之间的最小间距 在水平方向  设置的是cell上下之间的最小间距
    flowLayout.minimumInteritemSpacing = 0;
    //设置collectionViewCell的大小
    
    flowLayout.itemSize = CGSizeMake((KMainScreenWidth)/5 , (KMainScreenHeight-200 ) / 6);

    //第一个参数  位置大小
    //第二个参数  流布局对象 （UICollectionViewFlowLayout）
    
    
    self.collcetionView  =[[ UICollectionView alloc]initWithFrame:CGRectMake(0, 200, KMainScreenWidth - 0, KMainScreenHeight-200) collectionViewLayout:flowLayout];
    [self.scrollView addSubview:self.collcetionView];
    self.collcetionView.backgroundColor = RGBA(102, 102, 102, 1.0);
    
    self.collcetionView.delegate = self ;
    self.collcetionView.dataSource =self ;
    self.collcetionView.bounces = NO;
    self.collcetionView.delaysContentTouches = NO;
    //    在这个地方进行cell复用注册
    [self.collcetionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"kCellIdentifier"] ;
    
    UICollectionViewFlowLayout * flowLayout2 = [[UICollectionViewFlowLayout alloc] init] ;
    //设置collectionView的滑动方向
    //UICollectionViewScrollDirectionVertical 垂直滑动   默认滑动方向
    //UICollectionViewScrollDirectionHorizontal 水平滑动
    //    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //在垂直方向  设置的是cell上下之间的最小间距 在水平方向  设置的是cell左右之间的最小间距
    flowLayout2.minimumLineSpacing = 0 ;
    //在垂直方向  设置的是cell左右之间的最小间距 在水平方向  设置的是cell上下之间的最小间距
    flowLayout2.minimumInteritemSpacing = 0;
    //设置collectionViewCell的大小
    
    flowLayout2.itemSize = CGSizeMake((KMainScreenWidth)/5 , (KMainScreenHeight-200 ) / 6);
    
    //    在这个地方进行cell复用注册
    self.collcetionViewRight  =[[ UICollectionView alloc]initWithFrame:CGRectMake(KMainScreenWidth, 200 , KMainScreenWidth - 0, KMainScreenHeight-200) collectionViewLayout:flowLayout2];
    [self.scrollView addSubview:self.collcetionViewRight];
    self.collcetionViewRight.backgroundColor = RGBA(102, 102, 102, 1.0);
    self.collcetionViewRight.delegate = self ;
    self.collcetionViewRight.dataSource =self ;
    self.collcetionViewRight.bounces = NO;
    self.collcetionViewRight.delaysContentTouches = NO;

    //    在这个地方进行cell复用注册
    [self.collcetionViewRight registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"kCellIdentifier"] ;
}
#pragma mark -- UICollectionViewDelegate 代理方法
//设置每个分组中collectionViewCell的数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kCellIdentifier" forIndexPath:indexPath] ;
    
    cell.backgroundColor = RGBA(102, 102, 102, 1.0);
    if (collectionView == _collcetionView) {
        cell.titleLb.text = self.titleArray1[indexPath.row];

    }else{
    cell.titleLb.text = self.titleArray2[indexPath.row];
    }
    if (indexPath.row == 0||
        indexPath.row == 1||
        indexPath.row == 2||
        indexPath.row == 3||
        indexPath.row == 4||
        indexPath.row == 5||
        indexPath.row == 6||
        indexPath.row == 7 ||
        indexPath.row == 8) {
        cell.bgView.backgroundColor = RGBA(128.0, 128.0, 128.0, 1.0);
        cell.titleLb.textColor =[UIColor whiteColor];
    }
    
    if (indexPath.row == 4||
        indexPath.row == 9||
        indexPath.row == 14||
        indexPath.row == 19||
         indexPath.row == 24||
        indexPath.row == 29){
        cell.bgView.backgroundColor = RGBA(5.0, 158.0, 252.0, 1.0);
         cell.titleLb.textColor =[UIColor whiteColor];
    }
    if (indexPath.row == 10||
        indexPath.row == 15||
        indexPath.row == 20) {
        cell.bgView.backgroundColor = RGBA(250, 247, 74, 1.0);
    }
    if (indexPath.row == 25||
        indexPath.row == 26||
        indexPath.row == 27
        ||indexPath.row == 28) {
        cell.bgView.backgroundColor = RGBA(211, 54, 117, 1.0);
    }
    return cell ;
}
//当cell高亮时返回是否高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell =(CollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    //设置(Highlight)高亮下的颜色
    [cell.bgView setBackgroundColor:[UIColor blackColor]];
}

- (void)collectionView:(UICollectionView *)collectionView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell = (CollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    //设置(Nomal)正常状态下的颜色
    if (indexPath.row == 0||
        indexPath.row == 1||
        indexPath.row == 2||
        indexPath.row == 3||
        indexPath.row == 4||
        indexPath.row == 5||
        indexPath.row == 6||
        indexPath.row == 7 ||
        indexPath.row == 8) {
        cell.bgView.backgroundColor = RGBA(128.0, 128.0, 128.0, 1.0);
        cell.titleLb.textColor =[UIColor whiteColor];
    }else if (indexPath.row == 4||
        indexPath.row == 9||
        indexPath.row == 14||
        indexPath.row == 19||
        indexPath.row == 24||
        indexPath.row == 29){
        cell.bgView.backgroundColor = RGBA(5.0, 158.0, 252.0, 1.0);
        cell.titleLb.textColor =[UIColor whiteColor];
    }
    else if (indexPath.row == 10||
        indexPath.row == 15||
        indexPath.row == 20) {
        cell.bgView.backgroundColor = RGBA(250, 247, 74, 1.0);
    }
    else if (indexPath.row == 25||
        indexPath.row == 26||
        indexPath.row == 27
        ||indexPath.row == 28) {
        cell.bgView.backgroundColor = RGBA(211, 54, 117, 1.0);
    }else{
    [cell.bgView setBackgroundColor:[UIColor whiteColor]];
}
}
- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.bounces = NO;
        self.scrollView.delaysContentTouches = NO;
        self.scrollView.delegate = self;
        self.scrollView.backgroundColor = [UIColor blackColor];
        self.scrollView.contentSize = CGSizeMake(2 * KMainScreenWidth, KMainScreenHeight);

    }
    return _scrollView;
}
// 配置在线
-(void)configureOnlineTTS{
    //#error "Set api key and secret key"
    [[BDSSpeechSynthesizer sharedInstance] setApiKey:@"7CYOH5SXgR3hYoKfqN7nft2v" withSecretKey:@"b35d0d9ecfd7dd7ea2113b2608d78a14"];

    // 合成参数设置
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt:BDS_SYNTHESIZER_SPEAKER_FEMALE]
                                                  forKey:BDS_SYNTHESIZER_PARAM_SPEAKER ];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt:5]
                                                  forKey:BDS_SYNTHESIZER_PARAM_VOLUME];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt:7]
                                                  forKey:BDS_SYNTHESIZER_PARAM_SPEED];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt:5]
                                                  forKey:BDS_SYNTHESIZER_PARAM_PITCH];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt: BDS_SYNTHESIZER_AUDIO_ENCODE_MP3_16K]
                                                  forKey:BDS_SYNTHESIZER_PARAM_AUDIO_ENCODING ];


}
// 配置离线
-(void)configureOfflineTTS{
    [[BDSSpeechSynthesizer sharedInstance] setApiKey:@"4qU1Z3PPqAak3wSnLEy6GfcY" withSecretKey:@"249133f83c14ec6e49e4e6d4decb50de"];
    NSString* offlineEngineSpeechData = [[NSBundle mainBundle] pathForResource:@"Chinese_Speech_Female" ofType:@"dat"];
    NSString* offlineEngineTextData = [[NSBundle mainBundle] pathForResource:@"Chinese_Text" ofType:@"dat"];
    NSString* offlineEngineEnglishSpeechData = [[NSBundle mainBundle] pathForResource:@"English_Speech_Female" ofType:@"dat"];
    NSString* offlineEngineEnglishTextData = [[NSBundle mainBundle] pathForResource:@"English_Text" ofType:@"dat"];
    NSString* offlineEngineLicenseFile = [[NSBundle mainBundle] pathForResource:@"offline_engine_tmp_license" ofType:@"dat"];
    //#error "set offline engine license"
    NSError* err = [[BDSSpeechSynthesizer sharedInstance] loadOfflineEngine:offlineEngineTextData speechDataPath:offlineEngineSpeechData licenseFilePath:offlineEngineLicenseFile withAppCode:@"10192645"]; //
    if (err) {
        NSLog(@"运行出错%@", err);
        return;
    }
    err = [[BDSSpeechSynthesizer sharedInstance] loadEnglishDataForOfflineEngine:offlineEngineEnglishTextData speechData:offlineEngineEnglishSpeechData];
    if (err) {
        NSLog(@"运行出错%@", err);
        return;
    }

    // 合成参数设置
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt:BDS_SYNTHESIZER_SPEAKER_FEMALE]
                                                  forKey:BDS_SYNTHESIZER_PARAM_SPEAKER ];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt:5]
                                                  forKey:BDS_SYNTHESIZER_PARAM_VOLUME];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt:7]
                                                  forKey:BDS_SYNTHESIZER_PARAM_SPEED];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt:5]
                                                  forKey:BDS_SYNTHESIZER_PARAM_PITCH];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:[NSNumber numberWithInt: BDS_SYNTHESIZER_AUDIO_ENCODE_MP3_16K]
                                                  forKey:BDS_SYNTHESIZER_PARAM_AUDIO_ENCODING ];
}
- (void)speakSentence:(NSString *)message
{
        [[BDSSpeechSynthesizer sharedInstance] speakSentence:message withError:nil];

}

@end
