//
//  SideMenuViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuTableViewCell.h"
#import "IIViewDeckController.h"

@interface SideMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray *menuNameArray;
@end
