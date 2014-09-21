//
//  CompanyDetailViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyDetailTableViewCell.h"

@interface CompanyDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

- (IBAction)tapBackButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSDictionary *targetCompany;
@end
