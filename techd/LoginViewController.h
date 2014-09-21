//
//  LoginViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

@interface LoginViewController : UIViewController

@property (nonatomic) ACAccountStore *accountStore;
- (IBAction)tapLoginButton:(id)sender;

@end
