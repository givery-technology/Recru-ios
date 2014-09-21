//
//  CompanyListViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "CompanyTableViewCell.h"
#import "CompanyDetailViewController.h"

@interface CompanyListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
- (IBAction)tapMenuButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray * companyList;

@end
