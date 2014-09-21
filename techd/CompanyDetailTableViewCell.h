//
//  CompanyDetailTableViewCell.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *inductryLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@end
