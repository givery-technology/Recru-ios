//
//  FriendDetailViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
- (IBAction)tapBackButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
