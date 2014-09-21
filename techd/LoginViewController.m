//
//  LoginViewController.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)connectFacebook{
    if (self.accountStore == nil) {
        self.accountStore = [ACAccountStore new];
    }
    
    ACAccountType *accountType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];  //  Facebookを指定
    
    NSDictionary *options = @{ ACFacebookAppIdKey : @"954478067901445",
                               ACFacebookAudienceKey : ACFacebookAudienceEveryone,
                               ACFacebookPermissionsKey : @[@"email"] };
    
    [self.accountStore
     requestAccessToAccountsWithType:accountType
     options:options
     completion:^(BOOL granted, NSError *error) {
         dispatch_async(dispatch_get_main_queue(), ^{
             if (granted) {
                 // ユーザーがFacebookアカウントへのアクセスを許可した
                 NSArray *facebookAccounts = [self.accountStore accountsWithAccountType:accountType];
                 if (facebookAccounts.count > 0) {
                     ACAccount *facebookAccount = [facebookAccounts lastObject];
                     
                     // メールアドレスを取得する
                     NSString *uid = [[facebookAccount valueForKey:@"properties"] objectForKey:@"uid"];
                     NSString *fullName = [[facebookAccount valueForKey:@"properties"] objectForKey:@"fullname"];
                     
                     // アクセストークンを取得する
                     ACAccountCredential *facebookCredential = [facebookAccount credential];
                     NSString *accessToken = [facebookCredential oauthToken];
                     
                     NSLog(@"uid:%@, token:%@", uid, accessToken);
                     [SVProgressHUD show];
                     [Timeline createUser:uid name:fullName].always(^(NSData *data){
                         [SVProgressHUD dismiss];
                         NSArray *datas = (NSArray*)data;
                         NSString *user_id = datas[0][@"id"];
                         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                         [defaults setBool:YES forKey:@"isLogin"];
                         [defaults setObject:user_id forKey:@"userId"];
                         [defaults synchronize];
                         [self performSegueWithIdentifier:@"loginToMain" sender:self];
                     });
                     
                     
                 }
             } else {
                 if([error code]== ACErrorAccountNotFound){
                     //  iOSに登録されているFacebookアカウントがありません。
                     NSLog(@"iOSにFacebookアカウントが登録されていません。設定→FacebookからFacebookアカウントを追加してください。");
                 } else {
                     // ユーザーが許可しない
                     // 設定→Facebook→アカウントの使用許可するApp→YOUR_APPをオンにする必要がある
                     NSLog(@"Facebookが有効になっていません。");
                 }
             }
         });
     }];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tapLoginButton:(id)sender {
    [self connectFacebook];
}
@end
