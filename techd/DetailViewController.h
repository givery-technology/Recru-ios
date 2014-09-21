//
//  DetailViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "DetailTableViewCell.h"
#import "FeedView.h"

@interface DetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)tapBackButton:(id)sender;
- (IBAction)tapPostButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *commentView;

@property float nowKeyBoardY;

@property NSDictionary *targetStatus;

@property NSMutableArray *reactionList;

@end
