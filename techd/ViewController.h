//
//  ViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "IIViewDeckController.h"
#import "FeedView.h"
#import "DetailViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)tapPostButton:(id)sender;
- (IBAction)tapMenuButton:(id)sender;

@property NSMutableArray *timelineList;


@end
