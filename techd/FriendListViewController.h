//
//  FriendListViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "FriendTableViewCell.h"

@interface FriendListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
- (IBAction)tapMenuButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
